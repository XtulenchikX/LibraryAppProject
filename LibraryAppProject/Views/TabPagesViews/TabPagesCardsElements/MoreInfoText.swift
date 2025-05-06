import SwiftUI

// MARK: Card More Info Text Element

struct MoreInfoText: View {
    
    // MARK: - Body
    
    var body: some View {
        Text("Узнать подробнее...")
            .font(.custom("Helvetica Neue", size: 16))
            .foregroundStyle(.gray)
            .padding(.bottom)
            .padding(.horizontal)
        Spacer()
            .frame(height: 10)
    }
}
