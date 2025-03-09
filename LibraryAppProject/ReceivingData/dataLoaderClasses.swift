import Foundation


class EventLoader: ObservableObject {
    @Published var libEvents: [LibEvent] = []

    func loadEvents() {
        guard let url = URL(string: "https://testapi.com/events") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                // Декодирование объекта с ключом `events`
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
