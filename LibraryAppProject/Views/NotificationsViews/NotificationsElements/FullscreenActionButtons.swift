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
                Text("Принять")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: declineAction) {
                Text("Отклонить")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .frame(maxWidth: 300)
        .padding(.horizontal, 20)
    }
}

