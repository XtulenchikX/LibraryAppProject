import SwiftUI

// MARK: Generic For List Of Cards At Tab Page

struct GenericNavigationListView<DataType: Identifiable, DestinationView: View, RowView: View>: View {
    
    // MARK: - Input Properties
    
    let items: [DataType]
    let destination: (DataType) -> DestinationView
    let row: (DataType) -> RowView
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ForEach(items) { item in
                NavigationLink(destination: destination(item)) {
                    row(item)
                }
            }
        }
        .padding(.bottom, 15)
    }
}
