import Foundation

struct DeepLinkHandler {
    static func handleDeepLink(url: URL) -> Tab? {
        if url.scheme == "cbs-pr" {
            switch url.host {
            case Tab.libraries.rawValue:
                return .libraries
            case Tab.events.rawValue:
                return .events
            case Tab.info.rawValue:
                return .info
            default:
                return nil
            }
        }
        return nil
    }
}

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
