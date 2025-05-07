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
    
    // MARK: - Fullscreen Endpoint
    
    static var fullscreen: URL {
        URL(string: "\(Environment.baseURL)/fullscreen")!
    }
}
