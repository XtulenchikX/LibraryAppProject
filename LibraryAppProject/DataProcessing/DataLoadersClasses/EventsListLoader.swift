import Foundation

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
        guard let url = URL(string: "https://testapi.com/events") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(EventResponse.self, from: data)
                DispatchQueue.main.async {
                    self.libEvents = response.events
                }
            } catch {
                print("Ошибка декодирования: \(error)")
            }
        }.resume()
    }
}
