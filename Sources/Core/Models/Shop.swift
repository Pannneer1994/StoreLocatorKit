
import Foundation
import CoreLocation

public struct Shop {
    public let name: String
    public let coordinate: CLLocationCoordinate2D

    public init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
