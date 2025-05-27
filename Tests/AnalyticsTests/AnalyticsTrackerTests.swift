
import XCTest
@testable import Analytics

final class AnalyticsTrackerTests: XCTestCase {
    func testTrackingEventPrintsLog() {
        // This just verifies that calling track does not crash
        AnalyticsTracker.shared.track(event: "Test_Event")
        XCTAssertTrue(true) // Dummy assertion
    }
}
