import SwiftUI

// MARK: - Reusable Detail View Info Row

struct DetailViewInfoRow: View {
    
    // MARK: - Input Properties
    
    let systemImageName: String
    let text: String
    let font: Font
    let color: Color
    
    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .foregroundColor(color)
            Text(text)
                .font(font)
                .foregroundColor(color)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom, 5)
        .padding(.horizontal)
    }
}
