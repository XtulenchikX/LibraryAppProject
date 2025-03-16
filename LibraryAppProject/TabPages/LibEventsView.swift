import SwiftUI


struct LibEventCardView: View {
    var libEvent: LibEvent
    
    var body: some View {
        VStack(alignment: .leading) {
            CardHeaderImage(imageURL: libEvent.imageURL, plugImageName: "image5")
            
            CardTitleText(eventName: libEvent.eventName, customColor: customColor)
            
            CardTime(dateTime: libEvent.dateTime, customColor: customColor, customFont: customFont)
            
            CardLocation(location: libEvent.eventLoc, customColor: customColor, customFont: customFont)
            
            MoreInfoText()
        }
        .background(customColor3)
        .cornerRadius(10)
        .padding(10)
        .padding(.bottom, -15)
    }
}

struct LibEventsView: View {
    @State private var selectedType: String? = nil
    
    let libEvents: [LibEvent]
    
    var uniqueTypes: [String] {
        return Array(Set(libEvents.map { $0.eventType })).sorted()
    }
    
    var filteredEvents: [LibEvent] {
        if let type = selectedType {
            return libEvents.filter { $0.eventType == type }
        }
        return libEvents
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(uniqueTypes, id: \.self) { type in
                                Button(action: {
                                    selectedType = selectedType == type ? nil : type
                                }) {
                                    Text(type)
                                        .padding()
                                        .bold()
                                        .background(selectedType == type ? customColor : customColor2)
                                        .foregroundColor(selectedType == type ? Color.white : Color.black)
                                        .cornerRadius(10)
                                    
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                    }
                    VStack {
                        ForEach(filteredEvents) { event in
                            NavigationLink(destination: LibEventDetailView(libEventData: getLibEventById(eventId: event.eventId))) {
                                LibEventCardView(libEvent: event)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(customColor4, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Ближайшие мероприятия")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
            }
            
        }
    }
}

struct LibEventDetailView: View {
    var libEventData: LibEventData
    @State private var showWebView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: libEventData.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure(_):
                        Image("image5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    @unknown default:
                        Image("image5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                HStack {
                    Text(libEventData.eventType)
                        .font(customFont)
                        .bold()
                        .foregroundColor(customColor)
                    
                    Text(libEventData.ageRating)
                        .font(.headline)
                        .frame(width: 60)
                        .background(customColor)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                Divider()
                Text(libEventData.eventName)
                    .font(.custom("Helvetica Neue", size: 20))
                    .padding(.horizontal)
                    .foregroundColor(customColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
                Text(libEventData.eventData)
                    .font(customFont)
                    .foregroundColor(customColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 25)
                Divider()
                    .padding(.bottom, 5)
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(customColor)
                    Text(libEventData.dateTime)
                        .font(customFont)
                        .foregroundColor(customColor)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 1)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(customColor)
                    Text(libEventData.eventLoc)
                        .font(customFont)
                        .foregroundColor(customColor)
                        .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 5)
                .padding(.horizontal)
                if let link = libEventData.eventLink, !link.isEmpty {
                    HStack(spacing: 16) {
                        Button(action: {
                            if let url = URL(string: link) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text("На сайт")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(customColor)
                                .cornerRadius(10)
                                .lineLimit(1)
                        }

                        Button(action: {
                            showWebView = true
                        }) {
                            Text("Открыть в приложении")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(customColor)
                                .cornerRadius(10)
                                .lineLimit(1)
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Описание мероприятия")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(customColor)
            }
        }
        .sheet(isPresented: $showWebView) {
            if let link = libEventData.eventLink, let url = URL(string: link) {
                WebViewContainer(url: url, isPresented: $showWebView)
            }
        }
    }
}

#Preview {
        LibEventsView(libEvents: [
            LibEvent(imageURL: "image1", eventName: "Влияние занятий йогой на организм человека", dateTime: "1 ноября 12:00", eventLoc: "Санкт-Петербург, ул. Воскова, д. 2", eventType: "Мастер класс", eventId: 1, libId: 1),
            LibEvent(imageURL: "image2", eventName: "Петроглифы и наскальные знаки на территории Ленобласти", dateTime: "1 ноября 18:30", eventLoc: "Санкт-Петербург, ул. Воскова, д. 2", eventType: "Лекция", eventId: 2, libId: 1),
            LibEvent(imageURL: "image3", eventName: "Коробочки в технике оригами", dateTime: "2 ноября 13:00", eventLoc: "Санкт-Петербург, ул. Воскова, д. 2", eventType: "Мастер класс", eventId: 3, libId: 1),
            LibEvent(imageURL: "image4", eventName: "Варлам Шаламов. Стиль или документ, ужас или красота?", dateTime: "2 ноября 18:00", eventLoc: "Санкт-Петербург, ул. Воскова, д. 2", eventType: "Лекция", eventId: 4, libId: 1),
            LibEvent(imageURL: "image5", eventName: "Клоунада", dateTime: "3 ноября 15:00", eventLoc: "Санкт-Петербург, ул. Воскова, д. 2", eventType: "Развлечение", eventId: 5, libId: 2)
        ])
}

