import SwiftUI

// MARK: - Detail View Button for Web View Open

struct DetailViewLinkButton: View {
    
    // MARK: - Input Properties
    
    let link: String
    let customColor: Color
    let buttonText: String
    
    // MARK: - Bindings
    
    @Binding var showWebView: Bool
    
    // MARK: - Body

    var body: some View {
        if !link.isEmpty {
            HStack(spacing: 16) {
                Button(action: {
                    showWebView = true
                }) {
                    Text(buttonText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(customColor)
                        .cornerRadius(10)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
        }
    }
}
