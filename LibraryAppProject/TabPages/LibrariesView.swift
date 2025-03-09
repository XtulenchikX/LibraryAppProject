import SwiftUI


struct LibraryCardView: View {
    var library: Library
    
    var body: some View {
        VStack(alignment: .leading) {
            CardHeaderImage(imageURL: library.imageURL, plugImageName: "libImage")

            CardTitleText(eventName: library.libName, customColor: customColor)

            CardLocation(location: library.libLoc, customColor: customColor, customFont: customFont)

            MoreInfoText()
        }
        .background(customColor3)
        .cornerRadius(10)
        .padding(10)
        .padding(.bottom, -15)
    }
}

struct LibrariesView: View {
    @State private var selectedType: String? = nil
    
    let libraries: [Library]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 10)
                    VStack {
                        ForEach(libraries) {library in
                            NavigationLink(destination: LibraryDetailView(libraryData: getLibraryById(libId: library.libId))) {
                                LibraryCardView(library: library)
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 10)
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Наши библиотеки")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
            }
            .toolbarBackground(customColor4, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct LibraryDetailView: View {
    var libraryData: LibraryData
    @State private var selectedImageNew: String? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: libraryData.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure(_):
                        Image("libImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    @unknown default:
                        Image("libImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                Text(libraryData.libName)
                    .font(.custom("Helvetica Neue", size: 22))
                    .padding(.horizontal)
                    .foregroundColor(customColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(customColor)
                    Text(libraryData.libLoc)
                        .font(customFont)
                        .foregroundColor(customColor)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 5)
                .padding(.horizontal)
                
                ExpandableDescriptionView(title: "История библиотеки", description: libraryData.libDesc, customColor: customColor, customFont: serifShapedFont)
                
                ImagesScrollCollection(imageURLs: libraryData.imagesList, selectedImage: $selectedImageNew)
                
                Divider()
                    
                
                let events = getEventsByLibId(libId: libraryData.libId)

                if !events.isEmpty {
                    Text("Ближайшие мероприятия")
                        .font(.custom("Helvetica Neue", size: 20))
                        .bold()
                        .padding(.horizontal)
                        .foregroundColor(customColor)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(events, id: \.eventId) { event in
                                NavigationLink(destination: LibEventDetailView(libEventData: getLibEventById(eventId: event.eventId))) {
                                    SubEventCardView(libEvent: event)
                                        .frame(width: UIScreen.main.bounds.width * 0.7)
                                        .background(customColor3)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
                if let link = libraryData.libLink, !link.isEmpty {
                    Button(action: {
                        if let url = URL(string: link) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Перейти на сайт")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(customColor)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 15)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("О библиотеке")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(customColor)
            }
        }
    }
}




struct SubEventCardView: View {
    var libEvent: LibEvent
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(libEvent.eventName)
                .padding(.top)
                .font(.custom("Helvetica Neue", size: 18))
                .padding(.horizontal)
                .foregroundColor(customColor)
                .padding(.bottom, 5)
                .lineLimit(1)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(customColor)
                Text(libEvent.dateTime)
                    .font(customFont)
                    .foregroundColor(customColor)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
            }
            .padding(.bottom, 1)
            .padding(.horizontal, 25)
            
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(customColor)
                Text(libEvent.eventLoc)
                    .font(customFont)
                    .foregroundColor(customColor)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 25)
            
            Text("Узнать подробнее...")
                .font(.custom("Helvetica Neue", size: 16))
                .foregroundStyle(.gray)
                .padding(.bottom)
                .padding(.horizontal)
        }
    }
}

let exLibs = [Library(imageURL: "image1", libName: "Влияние занятий йогой на организм человека", timeOpen: "1 ноября 12:00", libLoc: "Санкт-Петербург, ул. Воскова, д. 2", libId: 1), Library(imageURL: "image1", libName: "Влияние занятий йогой на организм человека", timeOpen: "1 ноября 12:00", libLoc: "Санкт-Петербург, ул. Воскова, д. 2", libId: 1), Library(imageURL: "image1", libName: "Влияние занятий йогой на организм человека", timeOpen: "1 ноября 12:00", libLoc: "Санкт-Петербург, ул. Воскова, д. 2", libId: 1)]

#Preview {
    LibrariesView(libraries: exLibs)
}


