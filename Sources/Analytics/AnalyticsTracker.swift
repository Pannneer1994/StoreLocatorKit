
/// Tracks analytics events throughout the store locator flow.
/// Protocol defining analytics tracking methods.
public class AnalyticsTracker {
    public static let shared = AnalyticsTracker()

    private init() {}

    public func track(event: String) {
        print("Tracked event: \(event)")
    }
}
