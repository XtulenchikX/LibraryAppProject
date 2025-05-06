import SwiftUI
import WebKit

// MARK: - Web View Controller

struct WebViewController: UIViewRepresentable {
    
    // MARK: - Input Properties
    
    let url: URL
    
    // MARK: - UI View Representable
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
}
