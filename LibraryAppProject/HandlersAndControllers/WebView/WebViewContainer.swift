import SwiftUI
import WebKit

// MARK: - Web View Container

struct WebViewContainer: View {
    
    // MARK: - Input Properties
    
    let url: URL
    
    // MARK: - Bindings
    
    @Binding var isPresented: Bool
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .fill(customColor.opacity(0.8))
                        .frame(height: 40)
                        .edgesIgnoringSafeArea(.top)
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(4)
                    }
                    .background(Color.gray.opacity(0.4))
                    .clipShape(Circle())
                    .padding(.trailing, 15)
                    .padding(.top, 6)
                }
                
                WebViewController(url: url)
                    .padding(-10)
            }
        }
    }
}
