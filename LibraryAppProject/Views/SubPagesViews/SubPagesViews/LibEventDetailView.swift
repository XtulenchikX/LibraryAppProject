import SwiftUI

// MARK: - Event Page Detail Info View

struct LibEventDetailView: View {
    
    // MARK: - Input Properties
    
    var libEventData: LibEventData
    
    // MARK: - States
    
    @State private var showWebView = false
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailViewHeaderImage(
                    urlString: libEventData.imageURL,
                    plugImageName: "image5"
                )
                LibEventTagView(
                    eventType: libEventData.eventType,
                    ageRating: libEventData.ageRating,
                    customFont: customFont,
                    customColor: customColor
                )
                DetailViewTitleText(
                    title: libEventData.eventName,
                    color: customColor
                )
                Divider()
                    .padding(.bottom, 5)
                DetailViewDescriptionText(
                    description: libEventData.eventData,
                    font: serifShapedFont,
                    color: customColor
                )
                Divider()
                    .padding(.bottom, 5)
                DetailViewInfoRow(
                    systemImageName: "clock",
                    text: libEventData.dateTime,
                    font: customFont,
                    color: customColor
                )
                DetailViewInfoRow(
                    systemImageName: "mappin.and.ellipse",
                    text: libEventData.eventLoc,
                    font: customFont,
                    color: customColor
                )
                DetailViewLinkButton(
                    link: libEventData.eventLink ?? "",
                    customColor: customColor,
                    buttonText: "Перейти к регистрации",
                    showWebView: $showWebView
                )

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Описание мероприятия")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(customColor)
            }
        }
        .sheet(isPresented: $showWebView) {
            if let link = libEventData.eventLink, let url = URL(string: link) {
                WebViewContainer(url: url, isPresented: $showWebView)
            }
        }
    }
}
