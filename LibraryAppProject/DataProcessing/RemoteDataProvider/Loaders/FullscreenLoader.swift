import Foundation
import Combine

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
        APIManager.shared.fetchFullscreenData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let notification):
                    self.fullscreenData = notification
                case .failure(let error):
                    print("Ошибка загрузки фуллскрина: \(error)")
                }
            }
        }
    }
}

