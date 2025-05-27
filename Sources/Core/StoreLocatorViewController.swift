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
        guard let shopName = view.annotation?.title, let shopName = shopName?.lowercased() else { return}
        let productName = shopName.replacingOccurrences(of: " ", with: "_") + "_products"
        let products = ProductProvider.shared.fetchProducts(shopName: productName)
        let productListVC = ProductListViewController(products: products)
        
        navigationController?.pushViewController(productListVC, animated: true)
    }
    
    /// Accepts shop name and coordinate strings and sets up shop annotations.
    public func configureShops(shopName: String, latLong: [Location]) {
        var stores: [Shop] = []
        let shopLocations = latLong.map { location in
            let shop = Shop(name: shopName, latitude: location.latitude, longitude: location.longitude)
            stores.append(shop)
        }
        self.shops = stores
    }
}

#endif

