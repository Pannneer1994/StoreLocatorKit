#if os(iOS)

import XCTest
@testable import Core

final class StoreLocatorViewControllerTests: XCTestCase {
    func testStoreLocatorViewControllerLoads() {
        let vc = StoreLocatorViewController()
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc.view)
    }
}

#endif
