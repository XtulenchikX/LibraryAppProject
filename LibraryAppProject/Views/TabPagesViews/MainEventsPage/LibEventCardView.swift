import SwiftUI

// MARK: - Event Card For Events List Tab

struct LibEventCardView: View {
    
    // MARK: - Input Properties
    
    var libEvent: LibEvent
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            CardHeaderImage(
                imageURL: libEvent.imageURL,
                plugImageName: "image5"
            )
            CardTitleText(
                eventName: libEvent.eventName,
                customColor: customColor
            )
            CardInfoRow(
                systemImageName: "clock",
                text: libEvent.dateTime,
                customColor: customColor,
                customFont: customFont
            )
            CardInfoRow(
                systemImageName: "mappin.and.ellipse",
                text: libEvent.eventLoc,
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
