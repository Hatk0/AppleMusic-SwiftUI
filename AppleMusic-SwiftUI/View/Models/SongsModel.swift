import Foundation

struct SongsModel: Identifiable {
    let id = UUID()
    let image: String
    let songTitle: String
    let performer: String
}

extension SongsModel {
    static let song: [SongsModel] = [
        SongsModel(
            image: "backinblack",
            songTitle: "Back In Black",
            performer: "AC/DC"
        ),
        SongsModel(
            image: "fellonblackdays",
            songTitle: "Fell On Black Days",
            performer: "Soundgarden"
        ),
        SongsModel(
            image: "hurricane",
            songTitle: "Hurricane",
            performer: "Kanye West"
        ),
        SongsModel(
            image: "lightswitch",
            songTitle: "Light Switch",
            performer: "Charlie Puth"
        ),
        SongsModel(
            image: "modest",
            songTitle: "Modest",
            performer: "NEFFEX"
        ),
        SongsModel(
            image: "myway",
            songTitle: "My Way",
            performer: "Calvin Harris"
        ),
        SongsModel(
            image: "starfighter",
            songTitle: "Star Fighter",
            performer: "Wice"
        ),
        SongsModel(
            image: "thehive",
            songTitle: "The Hive",
            performer: "KLOUD"
        ),
        SongsModel(
            image: "themove",
            songTitle: "THE MOVE",
            performer: "Space Rangers"
        ),
        SongsModel(
            image: "thislove",
            songTitle: "This Love",
            performer: "Maroon 5"
        )
    ]
}
