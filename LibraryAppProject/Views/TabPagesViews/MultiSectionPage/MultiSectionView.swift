import SwiftUI

// MARK: - Multi Sections Tab View

struct MultiSectionView: View {
    
    // MARK: - States
    
    @State private var selectedTab = 0
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedTab == 0 {
                    ExtendBookSectionView()
                } else if selectedTab == 1 {
                    FeedbackSectionView()
                } else if selectedTab == 2 {
                    QuestionsSectionView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Image("logoCbs")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            SectionTabButton(
                                title: "Продлить книгу",
                                index: 0,
                                selected: $selectedTab
                            )
                            SectionTabButton(
                                title: "Оставить отзыв",
                                index: 1,
                                selected: $selectedTab
                            )
                            SectionTabButton(
                                title: "Популярные вопросы",
                                index: 2,
                                selected: $selectedTab
                            )
                        }
                    }
                }
            }
            .toolbarBackground(customColor2, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
