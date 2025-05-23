import SwiftUI

// MARK: - Fullscreen Action Buttons

struct FullscreenActionButtons: View {
    
    // MARK: - Input Properties
    
    var acceptAction: () -> Void
    var declineAction: () -> Void
    
    // MARK: - Body

    var body: some View {
        VStack(spacing: 15) {
            Button(action: acceptAction) {
                Text("Перейти к мероприятию")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(customColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: declineAction) {
                Text("Не интересно")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(customColor5)
                    .foregroundColor(customColor)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .frame(maxWidth: 300)
        .padding(.horizontal, 20)
    }
}

