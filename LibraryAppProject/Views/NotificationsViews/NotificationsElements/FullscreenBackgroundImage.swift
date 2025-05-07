import SwiftUI

// MARK: - Fullscreen Background

struct FullscreenBackgroundImage: View {
    
    // MARK: - Input Properties
    
    var imageURL: String
    var plugImageName: String
    
    // MARK: - Body
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
            case .failure(_):
                Image(plugImageName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
            @unknown default:
                Image(plugImageName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
            }
        }
    }
}
