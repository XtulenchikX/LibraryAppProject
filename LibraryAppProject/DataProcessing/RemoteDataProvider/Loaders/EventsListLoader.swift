import Foundation
import Combine

// MARK: - Events List Loader Class

class EventsListLoader: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var libEvents: [LibEvent] = []
    
    // MARK: - Initialization
    
    init() {
        loadEvents()
    }
    
    // MARK: - Public Methods
    
    func loadEvents() {
        APIManager.shared.fetchEvents { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let events):
                    self.libEvents = events
                case .failure(let error):
                    print("Ошибка загрузки событий: \(error)")
                }
            }
        }
    }
}

