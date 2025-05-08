import SwiftUI

// MARK: - Detail View Age Restriction And Event Type Tag

struct LibEventTagView: View {
    
    // MARK: - Input Properties
    
    let eventType: String
    let ageRating: String
    let customFont: Font
    let customColor: Color
    
    // MARK: - Body

    var body: some View {
        HStack {
            Text(eventType)
                .font(customFont)
                .bold()
                .foregroundColor(customColor)

            Text(ageRating)
                .font(.headline)
                .frame(width: 60, height: 25)
                .background(customColor)
                .cornerRadius(4)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal)
        .padding(.top, 1)
    }
}
