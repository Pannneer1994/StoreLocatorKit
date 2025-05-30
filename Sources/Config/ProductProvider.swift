
import Foundation

/// Protocol defining methods for fetching product data.
public protocol ProductProviding {
    func fetchProducts(shopName: String) -> [Product]
}

public struct Product: Codable {
    public let id: String
    public let name: String
    public let price: Double
}

/// Provides product data from a local JSON file bundled with the host app.
/// Protocol defining methods for fetching product data.
public class ProductProvider: ProductProviding {
    public static let shared = ProductProvider()

    private init() {}

    public func fetchProducts(shopName: String) -> [Product] {
        guard let url = Bundle.main.url(forResource: shopName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let products = try? JSONDecoder().decode([Product].self, from: data)
        else {
            return []
        }
        return products
    }
}
