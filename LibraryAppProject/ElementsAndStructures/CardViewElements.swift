import SwiftUI


struct CardHeaderImage: View {
    var imageURL: String
    var plugImageName: String

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

struct CardTitleText: View {
    var eventName: String
    var customColor: Color

    var body: some View {
        Text(eventName)
            .font(.custom("Helvetica Neue", size: 24))
            .padding(.horizontal)
            .foregroundColor(customColor)
            .padding(.bottom, 5)
            .multilineTextAlignment(.leading)
    }
}

struct CardTime: View {
    var dateTime: String
    var customColor: Color
    var customFont: Font

    var body: some View {
        HStack {
            Image(systemName: "clock")
                .foregroundColor(customColor)
            Text(dateTime)
                .font(customFont)
                .foregroundColor(customColor)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, 25)
        .padding(.bottom, 1)
    }
}

struct CardLocation: View {
    var location: String
    var customColor: Color
    var customFont: Font

    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(customColor)
            Text(location)
                .font(customFont)
                .foregroundColor(customColor)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom, 1)
        .padding(.horizontal, 25)
    }
}

struct MoreInfoText: View {
    var body: some View {
        Text("Узнать подробнее...")
            .font(.custom("Helvetica Neue", size: 16))
            .foregroundStyle(.gray)
            .padding(.bottom)
            .padding(.horizontal)
        Spacer()
            .frame(height: 10)
    }
}
