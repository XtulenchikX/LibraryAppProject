import SwiftUI
import Foundation

// MARK: Data Structure For Library Card

struct Library: Identifiable {
    var id = UUID()
    var imageURL: String
    var libName: String
    var timeOpen: String
    var libLoc: String
    var libId: Int
}

struct UpdLibrary: Identifiable {
    var id = UUID()
    var imageURL: String
    var libName: String
    var dateTime: String
    var libLoc: String
    var libId: Int
}
