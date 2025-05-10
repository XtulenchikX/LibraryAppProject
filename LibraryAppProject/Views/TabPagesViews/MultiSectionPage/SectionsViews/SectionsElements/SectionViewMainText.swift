import SwiftUI

// MARK: - Section View Info Text Element

struct SectionViewMainText: View {
    
    // MARK: - Input Properties
    
    let text: String
    let color: Color
    
    // MARK: - Body

    var body: some View {
        Text(text)
            .font(.custom("HelveticaNeue", size: 18))
            .padding(.horizontal)
            .foregroundColor(color)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            .padding(.top, 5)
    }
}
