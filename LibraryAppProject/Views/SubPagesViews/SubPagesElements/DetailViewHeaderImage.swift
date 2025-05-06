import SwiftUI

// MARK: - Deatil View Main Image Element

struct DetailViewHeaderImage: View {
    
    // MARK: - Input Properties
    
    let urlString: String
    let plugImageName: String
    
    // MARK: - Body

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
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
