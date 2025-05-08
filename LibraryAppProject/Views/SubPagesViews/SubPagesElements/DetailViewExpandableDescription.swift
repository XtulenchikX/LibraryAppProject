import SwiftUI

// MARK: - Detail View Expandable Description Text Element

struct DetailViewExpandableDescription: View {
    
    // MARK: - Input Properties
    
    var title: String
    var description: String
    var customColor: Color
    var customFont: Font
    
    // MARK: - States
    
    @State private var isDescriptionExpanded: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isDescriptionExpanded.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.custom("Helvetica Neue", size: 20))
                        .padding(.horizontal)
                        .foregroundColor(customColor)
                    Spacer()
                    Image(systemName: isDescriptionExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(customColor)
                        .padding(.trailing)
                }
                .padding(.bottom, 10)
            }
            
            if isDescriptionExpanded {
                Text(description)
                    .font(customFont)
                    .foregroundColor(customColor)
                    .multilineTextAlignment(.leading)
                    .padding(.top, -10)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 25)
                    .transition(.opacity)
            }
        }
    }
}
