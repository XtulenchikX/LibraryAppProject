import SwiftUI

// MARK: - Extend Book Section View

struct ExtendBookSectionView: View {
    
    // MARK: - States
    
    @State private var showWebView = false
    
    // MARK: - Body
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                SectionViewTitleText(
                    title: "Информация о продлении",
                    color: customColor4
                )
                SectionViewMainText(
                    text:
                        """
                        • Для продления книги необходимо заполнить форму, доступную по кнопке внизу страницы
                        • Ответы на популярные вопросы по продлению и взятию книг в библиотеке представлены ниже
                        """,
                    color: customColor4
                ).padding(.bottom, 15)
                SectionViewCollapsibleText(
                    title: "Сколько книг я могу взять?",
                    content:"В одной библиотеке Вы можете взять 10 экземпляров книг и 10 экземпляров журналов."
                )
                SectionViewCollapsibleText(
                    title: "На какой срок выдаются книги?",
                    content: "Книги выдаются на 30 календарных дней. При необходимости срок пользования можно продлить еще на 15 дней."
                )
                SectionViewCollapsibleText(
                    title: "Как продлить книги?",
                    content:
                        """
                        Книги можно продлить при личном визите в библиотеку, по телефону, через сайт и социальные сети, а также самостоятельно в личном кабинете на портале «Общедоступные библиотеки Санкт-Петербурга» или через мобильное приложение ЦБС в разделе "Продлить книгу".
                        Продлевайте книги до окончания основного срока пользования.
                        """
                )
                SectionViewLinkButton(link: "https://pr-cbs.ru/extend", customColor: customColor, buttonText: "Продлить книгу", showWebView: $showWebView)
            }
            .sheet(isPresented: $showWebView) {
                if let url = URL(string: "https://pr-cbs.ru/extend") {
                    WebViewContainer(url: url, isPresented: $showWebView)
                }
            }
        }
    }
}
