import SwiftUI

// MARK: - Section View Collapsible Text Element

struct SectionViewCollapsibleText: View {
    
    // MARK: - Input Properties
    
    let title: String
    let content: String
    
    var customFont: Font = .title3
    var customColor: Color = customColor4
    
    // MARK: - States

    @State private var isExpanded = false
    @State private var isVisible = false
    
    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isExpanded.toggle()
                }

                if isExpanded {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isVisible = true
                        }
                    }
                } else {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isVisible = false
                    }
                }
            }) {
                HStack {
                    Text(title)
                        .font(customFont)
                        .foregroundColor(customColor)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(customColor)
                }
            }
            if isExpanded || isVisible {
                Text(content)
                    .font(.body)
                    .foregroundColor(.gray)
                    .opacity(isVisible ? 1 : 0)
                    .offset(y: isVisible ? 0 : -10)
                    .animation(.easeInOut(duration: 0.25), value: isVisible)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(customColor ?? .gray, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
        )
        .padding(.horizontal)
    }
}
