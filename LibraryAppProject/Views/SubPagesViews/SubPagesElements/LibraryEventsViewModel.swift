import Combine
import SwiftUI

class LibraryEventsViewModel: ObservableObject {
    @Published var events: [LibEvent] = []
    @Published var isLoading: Bool = true

    private var cancellables = Set<AnyCancellable>()

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
