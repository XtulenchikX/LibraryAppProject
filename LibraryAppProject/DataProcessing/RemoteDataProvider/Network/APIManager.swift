import Foundation

// MARK: - Api Manager

final class APIManager {
    
    // MARK: - APIManager Init
    
    static let shared = APIManager()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Public Methods
    
    func fetchFullscreenData(completion: @escaping (Result<FullscreenNotification?, Error>) -> Void) {
        fetch(url: APIEndpoint.fullscreen, type: FullscreenNotificationResponse.self) { result in
            completion(result.map { $0.notification })
        }
    }
    
    func fetchEvents(completion: @escaping (Result<[LibEvent], Error>) -> Void) {
        fetch(url: APIEndpoint.events, type: EventResponse.self) { result in
            completion(result.map { $0.events })
        }
    }
    
    func fetchLibraries(completion: @escaping (Result<[Library], Error>) -> Void) {
        fetch(url: APIEndpoint.libraries, type: LibraryResponse.self) { result in
            completion(result.map { $0.libraries })
        }
    }
    
    // MARK: - Private Methods
    
    private func fetch<T: Decodable>(
        url: URL,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
