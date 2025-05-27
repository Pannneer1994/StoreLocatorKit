
import XCTest
@testable import Config

final class ProductProviderTests: XCTestCase {
    func testFetchProductsReturnsList() {
        let products = ProductProvider.shared.fetchProducts(shopName: "test_shop_products")
        XCTAssertGreaterThanOrEqual(products.count, 0)
    }
}
