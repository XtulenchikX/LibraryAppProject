import Foundation

// MARK: - Tab Deeplink Handler

struct DeepLinkHandler {
    static func handleDeepLink(url: URL) -> Tab? {
        if url.scheme == "cbs-pr" {
            switch url.host {
            case Tab.libraries.rawValue:
                return .libraries
            case Tab.events.rawValue:
                return .events
// Uncomment after adding 'info' tab at ContenView
//            case Tab.info.rawValue:
//                return .info
            default:
                return nil
            }
        }
        return nil
    }
}
