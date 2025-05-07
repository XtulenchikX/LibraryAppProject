import SwiftUI
import Foundation

// MARK: Data Structure For Library Card

struct Library: Identifiable, Codable {
    var id: Int { libId }
    var imageURL: String
    var libName: String
    var timeOpen: String
    var libLoc: String
    var libId: Int
}

struct UpdLibrary: Identifiable, Codable {
    var id: Int { libId }
    var imageURL: String
    var libName: String
    var dateTime: String
    var libLoc: String
    var libId: Int
}

// MARK: Data Mapping Structure

struct LibraryResponse: Codable {
    var libraries: [Library]
}
