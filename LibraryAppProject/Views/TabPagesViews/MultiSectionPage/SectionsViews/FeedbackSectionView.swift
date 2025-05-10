import SwiftUI

// MARK: - Feedback Section View

struct FeedbackSectionView: View {
    
    // MARK: - States
    
    @State private var showWebView = false
    
    // MARK: - Body
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                SectionViewTitleText(
                    title: "Рады вашим отзывам",
                    color: customColor4
                )
                SectionViewMainText(
                    text: "• Книга отзывов доступна по кнопке ниже",
                    color: customColor4
                )
                SectionViewLinkButton(link: "https://pr-cbs.ru/guestbook", customColor: customColor, buttonText: "Оставить отзыв", showWebView: $showWebView)
            }
            .sheet(isPresented: $showWebView) {
                if let url = URL(string: "https://pr-cbs.ru/guestbook") {
                    WebViewContainer(url: url, isPresented: $showWebView)
                }
            }
        }
    }
}
