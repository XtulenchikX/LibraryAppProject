import Foundation

// MARK: - Fullscreen Loader Class

class FullscreenLoader: ObservableObject {

    // MARK: - Public Properties

    @Published var fullscreenData: FullscreenNotification? = nil

    // MARK: - Initialization

    init() {
        loadFullscreenData()
    }

    // MARK: - Private Methods

    private func loadFullscreenData() {
        guard let url = URL(string: "https://testapi.com/fullscreen") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(FullscreenNotificationResponse.self, from: data)
                DispatchQueue.main.async {
                    self.fullscreenData = response.notification
                }
            } catch {
                print("Ошибка декодирования фуллскрина: \(error)")
            }
        }.resume()
    }
}
