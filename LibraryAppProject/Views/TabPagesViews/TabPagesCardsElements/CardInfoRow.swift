import SwiftUI

// MARK: - Reusable Card Info Row

struct CardInfoRow: View {
    
    // MARK: - Input Properties
    
    var systemImageName: String
    var text: String
    var customColor: Color
    var customFont: Font
    var horizontalPadding: CGFloat = 25

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .foregroundColor(customColor)
            Text(text)
                .font(customFont)
                .foregroundColor(customColor)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, 1)
    }
}
