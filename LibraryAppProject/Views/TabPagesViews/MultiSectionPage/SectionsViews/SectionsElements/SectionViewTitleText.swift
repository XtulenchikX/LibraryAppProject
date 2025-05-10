import SwiftUI

// MARK: - Section View Title Text Element

struct SectionViewTitleText: View {
    
    // MARK: - Input Properties
    
    let title: String
    let color: Color
    
    // MARK: - Body

    var body: some View {
        Text(title)
            .font(.custom("HelveticaNeue-Bold", size: 24))
            .padding(.horizontal)
            .foregroundColor(color)
            .multilineTextAlignment(.center)
            .padding(.top, 10)
    }
}
