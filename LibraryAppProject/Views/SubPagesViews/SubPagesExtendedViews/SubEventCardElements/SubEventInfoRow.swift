import SwiftUI

// MARK: - Library Page Events Selection Element Reusable Info Row

struct SubEventInfoRow: View {
    
    // MARK: - Input Properties
    
    var systemImageName: String
    var text: String
    var font: Font
    var color: Color
    
    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .foregroundColor(color)
            Text(text)
                .font(font)
                .foregroundColor(color)
                .lineLimit(1)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom, 1)
        .padding(.horizontal, 25)
    }
}
