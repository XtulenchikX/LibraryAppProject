import Foundation
import Combine

// MARK: - Libraries List Loader Class

class LibrariesListLoader: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var libraries: [Library] = []
    
    // MARK: - Initialization
    
    init() {
        loadLibraries()
    }
    
    // MARK: - Public Methods
    
    func loadLibraries() {
        APIManager.shared.fetchLibraries { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let libraries):
                    self.libraries = libraries
                case .failure(let error):
                    print("Ошибка загрузки событий: \(error)")
                }
            }
        }
    }
}
