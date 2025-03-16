import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
}


struct WebViewContainer: View {
    let url: URL
    @Binding var isPresented: Bool

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
                
                WebView(url: url)
                    .padding(-10)
            }
        }
    }
}


