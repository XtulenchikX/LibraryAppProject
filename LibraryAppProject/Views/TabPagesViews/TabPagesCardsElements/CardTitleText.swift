import SwiftUI

// MARK: Card Title Element

struct CardTitleText: View {
    
    // MARK: - Input Properties
    
    var eventName: String
    var customColor: Color
    
    // MARK: - Body

    var body: some View {
        Text(eventName)
            .font(.custom("Helvetica Neue", size: 24))
            .padding(.horizontal)
            .foregroundColor(customColor)
            .padding(.bottom, 5)
            .multilineTextAlignment(.leading)
    }
}
