import SwiftUI


struct ContentView: View {
    @StateObject private var eventLoader = EventsListLoader()
    @StateObject private var libraryLoader = LibrariesListLoader()
    @StateObject private var fullscreenLoader = FullscreenLoader()
    @State private var selectedTab: Tab = .libraries
    @State private var selectedEventId: Int? = nil
    @State private var isFullscreenPresented: Bool = false
    @State private var fullscreenData: FullscreenNotification? = nil
    @State private var isOpenByDeepLink: Bool = false

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                LibrariesView(libraries: libraryLoader.libraries)
                    .tabItem {
                        Label("Библиотеки", systemImage: "book")
                    }
                    .tag(Tab.libraries)
                    .refreshable {
                        libraryLoader.loadLibraries()
                    }

                LibEventsView(libEvents: eventLoader.libEvents)
                    .tabItem {
                        Label("Мероприятия", systemImage: "list.bullet")
                    }
                    .tag(Tab.events)
                    .refreshable {
                        eventLoader.loadEvents()
                    }
                MultiSectionView()
                    .tabItem {
                        Label("Читателю", systemImage: "person")
                    }
                    .tag(Tab.info)
            }
            .onReceive(fullscreenLoader.$fullscreenData.compactMap { $0 }) { notificationData in
                if !isOpenByDeepLink {
                    self.fullscreenData = notificationData
                    self.isFullscreenPresented = true
                }
            }
            .onOpenURL { url in
                if let tab = DeepLinkHandler.handleDeepLink(url: url) {
                    selectedTab = tab
                    self.isOpenByDeepLink = true
                }
                
                if let eventId = LibEventDeepLinkHandler.handleEventDeepLink(url: url) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.selectedEventId = eventId
                        self.isOpenByDeepLink = true
                    }
                }
            }

            if let selectedEventId = selectedEventId {
                NavigationStack {
                    LoadingDetailView(
                        loader: EventDetailLoader(),
                        loadAction: { $0.loadDetailEventData(eventId: selectedEventId) },
                        dataExtractor: { $0.eventDetailData },
                        content: { LibEventDetailView(libEventData: $0) }
                    )
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
            
            if $isFullscreenPresented.wrappedValue, !isOpenByDeepLink {
                if let fullscreenData = fullscreenData {
                    NavigationStack {
                        FullscreenNotificationView(notification: fullscreenData, isPresented: $isFullscreenPresented)
                            .transition(.move(edge: .trailing))
                            .zIndex(1)
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
