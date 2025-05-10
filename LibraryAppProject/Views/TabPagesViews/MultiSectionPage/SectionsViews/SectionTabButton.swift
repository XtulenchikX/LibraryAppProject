import SwiftUI

// MARK: - Subtab View For Section's List

struct SectionTabButton: View {
    
    // MARK: - Input Properties
    
    let title: String
    let index: Int
    
    // MARK: - Bindings
    
    @Binding var selected: Int
    
    // MARK: - Local Properties
    
    var font: Font = subsectionFont
    var color: Color = customColor4
    var horizontalPadding: CGFloat = 7
    
    // MARK: - Body
    
    var body: some View {
        Button {
            withAnimation { selected = index }
        } label: {
            Text(title)
                .font(font)
                .foregroundColor(color)
                .bold()
                .padding(.bottom, 5)
                .underline(selected == index)
        }
        .padding(.horizontal, horizontalPadding)
    }
}
