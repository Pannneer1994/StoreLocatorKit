
import MapKit

/// Protocol defining the interface for a map coordinator that handles shop annotations.
public protocol MapCoordinating {
    func addShops(_ shops: [Shop], to mapView: MKMapView)
}



/// Handles rendering and interaction with store annotations on the map.
/// Protocol defining the interface for a map coordinator that handles shop annotations.
public class MapCoordinator: MapCoordinating {
    public init() {}

    public func addShops(_ shops: [Shop], to mapView: MKMapView) {
        let annotations = shops.map { shop -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = shop.name
            annotation.coordinate = shop.coordinate
            return annotation
        }
        mapView.addAnnotations(annotations)

        if let first = shops.first {
            let region = MKCoordinateRegion(center: first.coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            mapView.setRegion(region, animated: true)
        }
    }
}
