import SwiftUI
import Foundation

// MARK: Data Structure For Event Card

struct LibEvent: Identifiable, Codable {
    var id: Int { eventId }
    var imageURL: String
    var eventName: String
    var dateTime: String
    var eventLoc: String
    var eventType: String
    var eventId: Int
    var libId: Int
}

struct UpdLibEvent: Identifiable, Codable {
    var id: Int { eventId }
    var imageURL: String
    var eventName: String
    var dateTime: String
    var eventLoc: String
    var eventType: String
    var eventId: Int
    var libId: Int
}

// MARK: Data Mapping Structure

struct EventResponse: Codable {
    var events: [LibEvent]
}
