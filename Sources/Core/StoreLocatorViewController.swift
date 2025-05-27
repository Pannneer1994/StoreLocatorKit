#if os(iOS)

import UIKit
import MapKit
import Config
import Analytics

/// Displays a map view with store locations and navigates to product list on selection.
/// Protocol defining the interface for the store locator view controller.
public class StoreLocatorViewController: UIViewController, MKMapViewDelegate {
    private let mapView = MKMapView()
    private let coordinator = MapCoordinator()
    
    public var shops: [Shop] = [] {
        didSet {
            coordinator.addShops(shops, to: mapView)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.frame = view.bounds
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        AnalyticsTracker.shared.track(event: "Store_Selected")
        
        let products = ProductProvider.shared.fetchProducts()
        let productListVC = ProductListViewController(products: products)
        
        navigationController?.pushViewController(productListVC, animated: true)
    }
    
    /// Accepts shop name and coordinate strings and sets up shop annotations.
    public func configureShops(shopName: String, coordinates: [String]) {
        let shops: [Shop] = coordinates.compactMap { coordStr in
            let parts = coordStr.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
            guard parts.count == 2,
                  let lat = Double(parts[0]),
                  let lon = Double(parts[1]) else {
                return nil
            }
            return Shop(name: shopName, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
        }
        
        self.shops = shops
    }
}

#endif

