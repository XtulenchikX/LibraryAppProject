import SwiftUI

struct LoadingDetailView<Loader: ObservableObject, DataType, Content: View>: View {
    
    // MARK: - Input Properties
    
    private let content: (DataType) -> Content
    private let loadAction: (Loader) -> Void
    private let dataExtractor: (Loader) -> DataType?
    
    // MARK: - States
    
    @StateObject private var loader: Loader
    @State private var hasAppeared = false
    
    // MARK: - Initialization

    init(
        loader: @autoclosure @escaping () -> Loader,
        loadAction: @escaping (Loader) -> Void,
        dataExtractor: @escaping (Loader) -> DataType?,
        @ViewBuilder content: @escaping (DataType) -> Content
    ) {
        _loader = StateObject(wrappedValue: loader())
        self.loadAction = loadAction
        self.dataExtractor = dataExtractor
        self.content = content
    }
    
    // MARK: - Body

    var body: some View {
        Group {
            if let data = dataExtractor(loader) {
                content(data)
            } else {
                ProgressView("Загрузка...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .onAppear {
            if !hasAppeared {
                hasAppeared = true
                loadAction(loader)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
