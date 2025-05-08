import Combine

// MARK: - Method For Getting Events List By Library Id

func GetLibraryEvents(libId: Int) -> AnyPublisher<[LibEvent], Never> {
    let eventsLoader = EventsListLoader()
    return eventsLoader.getLibraryEvents(libId: libId)
}
