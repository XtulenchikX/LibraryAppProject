import SwiftUI

// MARK: - Library Card For Libraries List Tab

struct LibraryCardView: View {
    
    // MARK: - Input Properties
    
    var library: Library
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            CardHeaderImage(
                imageURL: library.imageURL,
                plugImageName: "libImage"
            )
            CardTitleText(
                eventName: library.libName,
                customColor: customColor
            )
            CardInfoRow(
                systemImageName: "mappin.and.ellipse",
                text: library.libLoc,
                customColor: customColor,
                customFont: customFont
            )
            MoreInfoText()
        }
        .background(customColor3)
        .cornerRadius(10)
        .padding(10)
        .padding(.bottom, -15)
    }
}
