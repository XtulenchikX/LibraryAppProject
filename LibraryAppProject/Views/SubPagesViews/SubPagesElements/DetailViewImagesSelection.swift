import SwiftUI

// MARK: - Detail View Scrollable Images Selection

struct DetailViewImagesSelection: View {
    
    // MARK: - Input Properties
    
    var imageURLs: [String]
    
    // MARK: - Bindings
    
    @Binding var selectedImage: String?
    
    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(imageURLs, id: \.self) { imageURL in
                    Button(action: {
                        if selectedImage == imageURL {
                            selectedImage = nil
                        } else {
                            selectedImage = imageURL
                        }
                    }) {
                        VStack {
                            AsyncImage(url: URL(string: imageURL)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                case .failure(_):
                                    Image("placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                @unknown default:
                                    Image("placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                }
                            }
                        }
                        .padding(2)
                        .background(selectedImage == imageURL ? Color.blue.opacity(0.3) : Color.clear)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(selectedImage == imageURL ? Color.blue : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
        if let selectedImageURL = selectedImage {
            AsyncImage(url: URL(string: selectedImageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .transition(.slide)
                case .failure(_):
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .transition(.slide)
                @unknown default:
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .transition(.slide)
                }
            }
        }
    }
}
