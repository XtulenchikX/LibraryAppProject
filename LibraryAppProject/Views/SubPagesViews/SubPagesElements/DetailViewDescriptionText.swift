import SwiftUI

// MARK: - Deatil View Description Text Element

struct DetailViewDescriptionText: View {
    
    // MARK: - Input Properties
    
    let description: String
    let font: Font
    let color: Color
    
    // MARK: - Body

    var body: some View {
        Text(description)
            .font(font)
            .foregroundColor(color)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 5)
            .padding(.horizontal, 25)
    }
}
