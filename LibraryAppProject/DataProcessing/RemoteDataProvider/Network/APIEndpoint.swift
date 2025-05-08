import Foundation

// MARK: - Endpoints Enum

enum APIEndpoint {
    
    // MARK: - Events List Endpoint
    
    static var events: URL {
        URL(string: "\(Environment.baseURL)/events")!
    }
    
    // MARK: - Libraries List Endpoint
    
    static var libraries: URL {
        URL(string: "\(Environment.baseURL)/libraries")!
    }
    
    // MARK: - Event Detail Data Endpoint
    
    static func eventDetail(eventId: Int) -> URL {
        URL(string: "\(Environment.baseURL)/events/\(eventId)")!
    }
    
    // MARK: - Library Detail Data Endpoint
    
    static func libraryDetail(libId: Int) -> URL {
        URL(string: "\(Environment.baseURL)/libraries/\(libId)")!
    }
    
    // MARK: - Fullscreen Endpoint
    
    static var fullscreen: URL {
        URL(string: "\(Environment.baseURL)/fullscreen")!
    }
}
