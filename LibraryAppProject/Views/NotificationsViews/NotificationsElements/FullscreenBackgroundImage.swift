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
    }
}
