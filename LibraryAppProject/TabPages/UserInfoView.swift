import SwiftUI


struct Subsection1View: View {
    var body: some View {
        VStack {
            Text("Контент первого подраздела")
                .font(.title)
        }
    }
}


struct Subsection2View: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    ExpandableDescriptionView(title: "title 1", description: "aaaaaaaaaancbcbjbcjbwjcbme,cb,mebcjkbecnbejcnecnenckeneklnclenc", customColor: customColor, customFont: customFont)
                }
            }
        }
    }
}

struct NewSectionView: View {
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            VStack {
                if selectedTab == 0 {
                    Subsection1View()
                } else if selectedTab == 1 {
                    Subsection2View()
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
//                                .fontWeight(selectedTab == 0 ? .bold : .regular)
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
//                                .fontWeight(selectedTab == 1 ? .bold : .regular)
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


