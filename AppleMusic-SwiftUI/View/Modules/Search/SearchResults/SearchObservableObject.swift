import Foundation

class SearchObservableObject: ObservableObject {
    var data: [RadioModel] = []
    var songsData: [SongsModel] = []
    @Published var searchResults: [RadioModel] = []
    @Published var searchSongsResults: [SongsModel] = []
    
    init() {
        data = RadioModel.stations
        songsData = SongsModel.song
    }
    
    func updateSearchResults(for searchTerm: String) {
        self.searchResults = data.filter({ station in
            station.title.contains(searchTerm)
        })
    }
    
    func updateSongsSearchResults(for searchTerm: String) {
        self.searchSongsResults = songsData.filter({ song in
            song.songTitle.contains(searchTerm) || song.performer.contains(searchTerm)
        })
    }
}
