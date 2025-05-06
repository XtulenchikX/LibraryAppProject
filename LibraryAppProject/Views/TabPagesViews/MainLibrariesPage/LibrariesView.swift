import SwiftUI

// MARK: - Libraries List Tab View

struct LibrariesView: View {
    
    // MARK: - Input Properties
    
    let libraries: [Library]
    
    // MARK: - States
    
    @State private var selectedType: String? = nil
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 10)
                    GenericNavigationListView(
                        items: libraries,
                        destination: { library in
                            LibraryDetailView(libraryData: getLibraryById(libId: library.libId))
                        },
                        row: { library in
                            LibraryCardView(library: library)
                        }
                    )
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Наши библиотеки")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
            }
            .toolbarBackground(customColor4, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
