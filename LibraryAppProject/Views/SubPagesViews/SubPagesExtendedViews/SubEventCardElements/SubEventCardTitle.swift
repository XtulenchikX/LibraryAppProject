import SwiftUI

// MARK: - Library Page Events Selection Element Title

struct SubEventCardTitle: View {
    
    // MARK: - Input Properties
    
    var title: String
    var color: Color
    var font: Font
    
    // MARK: - Body

    var body: some View {
        Text(title)
            .padding(.top)
            .font(font)
            .padding(.horizontal)
            .foregroundColor(color)
            .padding(.bottom, 5)
            .lineLimit(1)
            .truncationMode(.tail)
            .multilineTextAlignment(.leading)
    }
}
