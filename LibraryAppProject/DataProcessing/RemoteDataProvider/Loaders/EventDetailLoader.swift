import Foundation
import Combine

// MARK: - Event Detail Loader Class

class EventDetailLoader: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var eventDetailData: LibEventData? = nil
    
    // MARK: - Public Methods
    
    func loadDetailEventData(eventId: Int) {
        APIManager.shared.fetchEventDetail(eventId: eventId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let event):
                    self.eventDetailData = event
                case .failure(let error):
                    print("Ошибка загрузки мероприятия по ID \(eventId): \(error)")
                    self.eventDetailData = nil
                }
            }
        }
    }
}
