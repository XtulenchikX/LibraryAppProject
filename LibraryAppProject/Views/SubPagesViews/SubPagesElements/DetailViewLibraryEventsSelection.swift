import SwiftUI

// MARK: - Deatil View Current Library Events Selection

struct LibraryEventsSection: View {
    
    // MARK: - Input Properties
    
    let libId: Int
    let customColor: Color
    let cardBackground: Color
    
    // MARK: - Body

    var body: some View {
        let events = getEventsByLibId(libId: libId)

        if !events.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                Text("Ближайшие мероприятия")
                    .font(.custom("Helvetica Neue", size: 20))
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(customColor)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(events, id: \.eventId) { event in
                            NavigationLink(destination: LibEventDetailView(libEventData: getLibEventById(eventId: event.eventId))) {
                                SubEventCardView(libEvent: event)
                                    .frame(width: UIScreen.main.bounds.width * 0.7)
                                    .background(cardBackground)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
