import SwiftUI


struct ContentView: View {
    @StateObject private var eventLoader = EventLoader()
    @State private var selectedTab: Tab = .libraries
    @State private var selectedEventId: Int? = nil

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                LibrariesView(libraries: GetLibList())
                    .tabItem {
                        Label("Библиотеки", systemImage: "book")
                    }
                    .tag(Tab.libraries)

                LibEventsView(libEvents: eventLoader.libEvents)
                    .tabItem {
                        Label("Мероприятия", systemImage: "list.bullet")
                    }
                    .tag(Tab.events)

                NewSectionView()
                    .tabItem {
                        Label("Новый раздел", systemImage: "square.grid.2x2")
                    }
                    .tag(Tab.info)
            }
            .onChange(of: selectedTab) { _, newTabIndex in
                if newTabIndex == Tab.events {
                    eventLoader.loadEvents()
                }
            }
            .onAppear {
                eventLoader.loadEvents()
            }
            .onOpenURL { url in
                if let tab = DeepLinkHandler.handleDeepLink(url: url) {
                    selectedTab = tab
                }
                
                if let eventId = LibEventDeepLinkHandler.handleEventDeepLink(url: url) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.selectedEventId = eventId
                    }
                }
            }

            if let selectedEventId = selectedEventId {
                NavigationStack {
                    LibEventDetailView(libEventData: getLibEventById(eventId: selectedEventId))
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    self.selectedTab = .events
                                    self.selectedEventId = nil
                                }) {
                                    Image(systemName: "chevron.left")
                                        .imageScale(.medium)
                                        .font(.title)
                                }
                            }
                        }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
