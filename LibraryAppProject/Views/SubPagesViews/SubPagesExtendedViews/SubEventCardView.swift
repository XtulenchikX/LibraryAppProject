import SwiftUI

// MARK: - Library Page Events Selection Card View

struct SubEventCardView: View {
    
    // MARK: - Input Properties
    
    var libEvent: LibEvent
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            SubEventCardTitle(
                title: libEvent.eventName,
                color: customColor,
                font: .custom("Helvetica Neue", size: 18)
            )
            SubEventInfoRow(
                systemImageName: "clock",
                text: libEvent.dateTime,
                font: customFont,
                color: customColor
            )
            SubEventInfoRow(
                systemImageName: "mappin.and.ellipse",
                text: libEvent.eventLoc,
                font: customFont,
                color: customColor
            )
            SubEventHint(text: "Узнать подробнее...")
        }
    }
}
