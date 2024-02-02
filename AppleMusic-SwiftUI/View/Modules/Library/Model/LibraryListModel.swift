import Foundation

struct LibraryListModel: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var isEdit: Bool = false
}

extension LibraryListModel {
    static var listPanel: [LibraryListModel] = [
        LibraryListModel(
            title: "Playlists",
            imageName: "music.note.list"
        ),
        LibraryListModel(
            title: "Artists",
            imageName: "music.mic"
        ),
        LibraryListModel(
            title: "Albums",
            imageName: "square.stack"
        ),
        LibraryListModel(
            title: "Songs",
            imageName: "music.note"
        ),
        LibraryListModel(
            title: "Made for You",
            imageName: "person.crop.square"
        ),
        LibraryListModel(
            title: "TV & Movies",
            imageName: "tv"
        ),
        LibraryListModel(
            title: "Music Videos",
            imageName: "music.note.tv"
        ),
        LibraryListModel(
            title: "Genres",
            imageName: "pianokeys"
        ),
        LibraryListModel(
            title: "Compilations",
            imageName: "person.2.crop.square.stack"
        ),
        LibraryListModel(
            title: "Composers",
            imageName: "music.quarternote.3"
        ),
        LibraryListModel(
            title: "Downloaded",
            imageName: "arrow.down.circle"
        ),
        LibraryListModel(
            title: "Home Sharing",
            imageName: "music.note.house"
        )
    ]
}
