import SwiftUI


struct ContentView: View {
    @StateObject private var eventLoader = EventLoader()
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            LibrariesView(libraries: GetLibList())
                .tabItem {
                    Label("Библиотеки", systemImage: "book")
                }
                .tag(0)

            LibEventsView(libEvents: eventLoader.libEvents)
                .tabItem {
                    Label("Мероприятия", systemImage: "list.bullet")
                }
                .tag(1)

            NewSectionView()
                .tabItem {
                    Label("Новый раздел", systemImage: "square.grid.2x2")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) {_, newTabIndex in
            if newTabIndex == 1 {
                eventLoader.loadEvents()
            }
        }
        .onAppear {
            eventLoader.loadEvents()
        }
    }
}


#Preview {
    ContentView()
}
