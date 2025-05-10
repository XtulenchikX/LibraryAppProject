import Combine
import SwiftUI

// MARK: - Library Detail View Events Selection Model

class LibraryEventsViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var events: [LibEvent] = []
    @Published var isLoading: Bool = true
    
    // MARK: - Private Properties

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Methods

    func loadEvents(libId: Int) {
        GetLibraryEvents(libId: libId)
            .sink { [weak self] events in
                guard let self = self else { return }
                self.events = events
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
}
