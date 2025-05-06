import SwiftUI

// MARK: - Library Page Detail Info View

struct LibraryDetailView: View {
    
    // MARK: - Input Properties
    
    var libraryData: LibraryData
    
    // MARK: - States
    
    @State private var selectedImageNew: String? = nil
    @State private var showWebView = false
    
    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailViewHeaderImage(
                    urlString: libraryData.imageURL,
                    plugImageName: "libImage"
                )
                DetailViewTitleText(
                    title: libraryData.libName,
                    color: customColor
                )
                DetailViewInfoRow(
                    systemImageName: "mappin.and.ellipse",
                    text: libraryData.libLoc,
                    font: customFont,
                    color: customColor
                )
                DetailViewExpandableDescription(
                    title: "История библиотеки",
                    description: libraryData.libDesc,
                    customColor: customColor,
                    customFont: serifShapedFont
                )
                DetailViewImagesSelection(
                    imageURLs: libraryData.imagesList,
                    selectedImage: $selectedImageNew
                )
                Divider()
                LibraryEventsSection(
                    libId: libraryData.libId,
                    customColor: customColor,
                    cardBackground: customColor3
                )

                DetailViewLinkButton(
                    link: libraryData.libLink ?? "",
                    customColor: customColor,
                    buttonText: "Посмотреть на сайте",
                    showWebView: $showWebView
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("О библиотеке")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(customColor)
            }
        }
        .sheet(isPresented: $showWebView) {
            if let link = libraryData.libLink, let url = URL(string: link) {
                WebViewContainer(url: url, isPresented: $showWebView)
            }
        }
    }
}
