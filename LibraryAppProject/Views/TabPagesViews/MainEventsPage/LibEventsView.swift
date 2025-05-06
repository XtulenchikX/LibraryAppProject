import SwiftUI

// MARK: - Libraries Events List Tab View

struct LibEventsView: View {
    
    // MARK: - Input Properties
    
    let libEvents: [LibEvent]
    
    // MARK: - States
    
    @State private var selectedType: String? = nil
    
    // MARK: - Computed Properties
    
    var uniqueTypes: [String] {
        return Array(Set(libEvents.map { $0.eventType })).sorted()
    }
    
    var filteredEvents: [LibEvent] {
        if let type = selectedType {
            return libEvents.filter { $0.eventType == type }
        }
        return libEvents
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LibEventTypeFilter(
                        types: uniqueTypes,
                        selectedType: selectedType,
                        onSelectType: { selectedType = $0 }
                    )
                    GenericNavigationListView(
                        items: filteredEvents,
                        destination: { event in
                            LibEventDetailView(libEventData: getLibEventById(eventId: event.eventId))
                        },
                        row: { event in
                            LibEventCardView(libEvent: event)
                        }
                    )
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(customColor4, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Ближайшие мероприятия")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
            }
        }
    }
}
