import SwiftUI
import Foundation

// MARK: Data Structure For Library Detail View

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

struct UpdLibraryData: Identifiable {
    var id = UUID()
    var imageURL: String
    var libName: String
    var dateTime: String
    var libLoc: String
    var libId: Int
    var libDesc: String
    var imagesList: [String]
    var libLink: String?
}
