// Preparation of a multisection view for further development
// Not called on project build
// To use deeplink use 'case = info' and tag info at 'ContentView' after calling the struct in code

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
                    InfoSectionView()
                } else if selectedTab == 1 {
                    QuestionsSectionView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("logoCbs")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Button(action: {
                            withAnimation {
                                selectedTab = 0
                            }
                        }) {
                            Text("Мои книги")
                                .font(subsectionFont)
                                .foregroundColor(Color.white)
                                .fontWeight(selectedTab == 0 ? .bold : .regular)
                                .bold()
                                .padding(.bottom, 5)
                                .underline(selectedTab == 0)
                        }
                        .padding(.horizontal, 5)
                        
                        Button(action: {
                            withAnimation {
                                selectedTab = 1
                            }
                        }) {
                            Text("Вопросы")
                                .font(subsectionFont)
                                .foregroundColor(Color.white)
                                .fontWeight(selectedTab == 1 ? .bold : .regular)
                                .bold()
                                .padding(.bottom, 5)
                                .underline(selectedTab == 1)
                        }
                    }
                }
            }
            .toolbarBackground(customColor4, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
