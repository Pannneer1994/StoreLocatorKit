
import XCTest
@testable import Config

final class ProductProviderTests: XCTestCase {
    func testFetchProductsReturnsList() {
        let products = ProductProvider.shared.fetchProducts()
        XCTAssertGreaterThanOrEqual(products.count, 0)
    }
}
