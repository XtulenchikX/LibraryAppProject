import Foundation
import Combine

// MARK: - Event Detail Loader Class

class LibraryDetailDataLoader: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var libraryDetailData: LibraryData? = nil
    
    // MARK: - Public Methods
    
    func loadDetailLibraryData(libId: Int) {
        APIManager.shared.fetchLibraryDetail(libId: libId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let event):
                    self.libraryDetailData = event
                case .failure(let error):
                    print("Ошибка загрузки мероприятия по ID \(libId): \(error)")
                    self.libraryDetailData = nil
                }
            }
        }
    }
}
