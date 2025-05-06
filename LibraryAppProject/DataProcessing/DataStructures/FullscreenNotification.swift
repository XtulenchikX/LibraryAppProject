import SwiftUI
import Foundation

// MARK: Data Structure For Full Screen Notification

struct FullscreenNotification: Codable {
    var imageURL: String
    var header: String
    var mainText: String
    var eventsId: Int
}

// MARK: Data Mapping Structure

struct FullscreenNotificationResponse: Codable {
    var notification: FullscreenNotification
}
