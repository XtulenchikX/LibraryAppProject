import SwiftUI
import Foundation

// MARK: Data Structure For Event Detail View

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

struct UpdLibEventData: Identifiable {
    var id = UUID()
    var imageURL: String
    var eventName: String
    var dateTime: String
    var eventLoc: String
    var eventType: String
    var eventId: Int
    var ageRating: String
    var eventData: String
    var eventTutor: String?
    var eventLink: String?
}
