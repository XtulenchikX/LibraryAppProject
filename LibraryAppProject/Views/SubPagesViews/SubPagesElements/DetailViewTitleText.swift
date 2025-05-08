import SwiftUI

// MARK: - Detail View Title Text Element

struct DetailViewTitleText: View {
    
    // MARK: - Input Properties
    
    let title: String
    let color: Color
    
    // MARK: - Body

    var body: some View {
        Text(title)
            .font(.custom("HelveticaNeue-Bold", size: 22))
            .padding(.horizontal)
            .foregroundColor(color)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 5)
    }
}
