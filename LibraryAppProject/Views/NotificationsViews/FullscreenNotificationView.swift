import SwiftUI

// MARK: - Fullscreen Notification View

struct FullscreenNotificationView: View {
    
    // MARK: - Input Properties
    
    let notification: FullscreenNotification
    
    // MARK: - Bindings
    
    @Binding var isPresented: Bool
    
    // MARK: - States
    
    @State private var isEventPresented: Bool = false
    
    // MARK: - Private Properties
    
    private let plugImageName = "fullscreenPlaceholder"
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            NotificationTextBlock(
                headerText: notification.header,
                mainText: notification.mainText
            )
            Spacer()
            FullscreenActionButtons(
                acceptAction: { isEventPresented = true },
                declineAction: { isPresented = false }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            FullscreenBackgroundImage(
                imageURL: notification.imageURL,
                plugImageName: plugImageName
            )
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
        }
        .fullScreenCover(isPresented: $isEventPresented) {
            NavigationStack {
                LibEventDetailView(libEventData: getLibEventById(eventId: notification.eventsId))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.isEventPresented = false
                                self.isPresented = false
                            }) {
                                Image(systemName: "chevron.left")
                                    .imageScale(.medium)
                                    .font(.title)
                            }
                        }
                    }
            }
        }
    }
}
