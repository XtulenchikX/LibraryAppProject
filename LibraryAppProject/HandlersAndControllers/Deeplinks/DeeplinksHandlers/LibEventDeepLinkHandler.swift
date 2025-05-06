import Foundation

// MARK: - Event Page Deeplink Handler

struct LibEventDeepLinkHandler {
    static func handleEventDeepLink(url: URL) -> Int? {
        guard url.scheme == "cbs-pr", url.host == "events" else { return nil }
        let components = url.pathComponents.filter { !$0.isEmpty }
        if components.count > 1, let eventId = Int(components[1]) {
            return eventId
        }
        return nil
    }
}
