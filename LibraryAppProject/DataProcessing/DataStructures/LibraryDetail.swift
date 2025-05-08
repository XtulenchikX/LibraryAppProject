import SwiftUI
import Foundation

// MARK: Data Structure For Library Detail View

struct LibraryData: Identifiable, Codable {
    var id: Int { libId }
    var imageURL: String
    var libName: String
    var timeOpen: String
    var libLoc: String
    var libId: Int
    var libDesc: String
    var imagesList: [String]
    var libLink: String?
}

struct UpdLibraryData: Identifiable, Codable {
    var id: Int { libId }
    var imageURL: String
    var libName: String
    var dateTime: String
    var libLoc: String
    var libId: Int
    var libDesc: String
    var imagesList: [String]
    var libLink: String?
}

// MARK: Data Mapping Structure

struct LibraryDetailResponse: Codable {
    let libraryDetailData: LibraryData
}
