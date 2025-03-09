import SwiftUI
import Foundation

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

struct EventResponse: Codable {
    var events: [LibEvent]
}

struct LibEventData: Identifiable {
    var id = UUID()
    var imageURL: String
    var eventName: String
    var dateTime: String
    var eventDateStart: String?
    var eventDateEnd: String?
    var eventTimeStart: String?
    var eventTimeEnd: String?
    var eventLoc: String
    var eventType: String
    var eventId: Int
    var ageRating: String
    var eventData: String
    var eventTutor: String?
    var eventLink: String?
}

struct Library: Identifiable {
    var id = UUID()
    var imageURL: String
    var libName: String
    var timeOpen: String
    var libLoc: String
    var libId: Int
}

struct LibraryData: Identifiable {
    var id = UUID()
    var imageURL: String
    var libName: String
    var timeOpen: String
    var libLoc: String
    var libId: Int
    var libDesc: String
    var imagesList: [String]
    var libLink: String?
}
