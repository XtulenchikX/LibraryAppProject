import SwiftUI

struct FullscreenNotificationView: View {
    let notification: FullscreenNotification
    let plugImageName = "placeholder"
    @Binding var isPresented: Bool
    @State private var isEventPresented: Bool = false
    
    var body: some View {
        
        ZStack {
            AsyncImage(url: URL(string: notification.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                case .failure(_):
                    Image(plugImageName)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                @unknown default:
                    Image(plugImageName)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
            
            VStack {
                Spacer()
                    .frame(height: 30)
                
                VStack(spacing: 10) {
                    Text(notification.header)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                    
                    Text(notification.mainText)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(radius: 5)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                        .padding(.horizontal, 20)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                VStack(spacing: 15) {
                    Button(action: {
                        isEventPresented = true
                    }) {
                        Text("Принять")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: { isPresented = false }) {
                        Text("Отклонить")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(maxWidth: 300)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
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
