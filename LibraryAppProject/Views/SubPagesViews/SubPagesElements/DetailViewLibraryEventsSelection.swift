import SwiftUI

// MARK: - Detail View Events Selection

struct DetailViewLibraryEventsSelection: View {
    
    // MARK: - Input Properties
    
    let libId: Int
    let customColor: Color
    let cardBackground: Color
    
    // MARK: - Observed Object

    @ObservedObject var viewModel = LibraryEventsViewModel()
    
    // MARK: - States
    
    @State private var hasLoaded = false
    
    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ближайшие мероприятия")
                .font(.custom("Helvetica Neue", size: 20))
                .bold()
                .padding(.horizontal)
                .foregroundColor(customColor)

            if viewModel.isLoading {
                ProgressView("Загружается...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else if viewModel.events.isEmpty {
                Text("Мероприятий в ближайнее время нет")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.events, id: \.eventId) { event in
                            NavigationLink(destination:
                                LoadingDetailView(
                                    loader: EventDetailLoader(),
                                    loadAction: { $0.loadDetailEventData(eventId: event.eventId) },
                                    dataExtractor: { $0.eventDetailData },
                                    content: { LibEventDetailView(libEventData: $0) }
                                )
                            ) {
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
        .onAppear {
            if !hasLoaded {
                hasLoaded = true
                viewModel.loadEvents(libId: libId)
            }
        }
    }
}
