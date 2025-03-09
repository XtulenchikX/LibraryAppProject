import SwiftUI

struct ExpandableDescriptionView: View {
    var title: String
    var description: String
    var customColor: Color
    var customFont: Font
    
    @State private var isDescriptionExpanded: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isDescriptionExpanded.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.custom("Helvetica Neue", size: 20))
                        .padding(.horizontal)
                        .foregroundColor(customColor)
                    Spacer()
                    Image(systemName: isDescriptionExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(customColor)
                        .padding(.trailing)
                }
                .padding(.bottom, 10)
            }
            
            if isDescriptionExpanded {
                Text(description)
                    .font(customFont)
                    .foregroundColor(customColor)
                    .multilineTextAlignment(.leading)
                    .padding(.top, -10)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 25)
                    .transition(.opacity)
            }
        }
    }
}

struct ImagesScrollCollection: View {
    var imageURLs: [String]
    @Binding var selectedImage: String?

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

