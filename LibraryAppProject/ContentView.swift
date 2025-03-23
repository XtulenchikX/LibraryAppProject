import SwiftUI


struct ContentView: View {
    @StateObject private var eventLoader = EventLoader()
    @State private var selectedTab: Tab = .libraries

    var body: some View {
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
        .onChange(of: selectedTab) {_, newTabIndex in
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
        }
    }
}


#Preview {
    ContentView()
}
