import SwiftUI

// MARK: - Fullscreen Text

struct NotificationTextBlock: View {
    
    // MARK: - Input Properties
    
    var headerText: String
    var mainText: String

    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            Text(headerText)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .shadow(radius: 5)
                .multilineTextAlignment(.center)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)

            Text(mainText)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(radius: 5)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                .padding(.horizontal, 20)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}

