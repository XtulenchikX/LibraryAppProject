import Foundation

// MARK: - Api Manager

final class APIManager {
    
    // MARK: - APIManager Init
    
    static let shared = APIManager()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Public Methods
    // MARK: - Events List Data
    
    func fetchEvents(completion: @escaping (Result<[LibEvent], Error>) -> Void) {
        fetch(url: APIEndpoint.events, type: EventResponse.self) { result in
            completion(result.map { $0.events })
        }
    }
    
    // MARK: - Libraries List Data
    
    func fetchLibraries(completion: @escaping (Result<[Library], Error>) -> Void) {
        fetch(url: APIEndpoint.libraries, type: LibraryResponse.self) { result in
            completion(result.map { $0.libraries })
        }
    }
    
    // MARK: - Event Detail Data
    
    func fetchEventDetail(eventId: Int, completion: @escaping (Result<LibEventData, Error>) -> Void) {
        fetch(url: APIEndpoint.eventDetail(eventId: eventId), type: EventDetailResponse.self) { result in
            completion(result.map { $0.eventDetailData })
        }
    }
    
    // MARK: - Library Detail Data
    
    func fetchLibraryDetail(libId: Int, completion: @escaping (Result<LibraryData, Error>) -> Void) {
        fetch(url: APIEndpoint.libraryDetail(libId: libId), type: LibraryDetailResponse.self) { result in
            completion(result.map { $0.libraryDetailData })
        }
    }
    
    // MARK: - Fullscreen
    
    func fetchFullscreenData(completion: @escaping (Result<FullscreenNotification?, Error>) -> Void) {
        fetch(url: APIEndpoint.fullscreen, type: FullscreenNotificationResponse.self) { result in
            completion(result.map { $0.notification })
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
