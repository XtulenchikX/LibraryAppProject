import SwiftUI

// MARK: Card Main Image Element

struct CardHeaderImage: View {
    
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
                    .aspectRatio(contentMode: .fit)
            case .failure(_):
                Image(plugImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                Image(plugImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
