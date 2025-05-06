import SwiftUI

// MARK: - Library Page Events Selection Element Hint Text

struct SubEventHint: View {
    
    // MARK: - Input Properties
    
    var text: String
    var font: Font = .custom("Helvetica Neue", size: 16)
    var color: Color = .gray
    
    // MARK: - Body

    var body: some View {
        Text(text)
            .font(font)
            .foregroundStyle(color)
            .padding(.bottom)
            .padding(.horizontal)
    }
}
