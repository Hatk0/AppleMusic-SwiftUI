import Foundation

struct RadioModel: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageName: String
}

extension RadioModel {
    static var star: [RadioModel] = [
        RadioModel(title: "Soft Pop Station", description: "Apple Music Pop", imageName: "softpop"),
        RadioModel(title: "Hits Station", description: "Apple Music Hits", imageName: "hits"),
        RadioModel(title: "Hip-Hop Station", description: "Apple Music Hip-Hop", imageName: "hip-hop"),
        RadioModel(title: "Pop Station", description: "Apple Music Pop", imageName: "pop"),
        RadioModel(title: "Classic Rock Station", description: "Apple Music Classic Rock", imageName: "classic-rock"),
        RadioModel(title: "Smooth Jazz Station", description: "Apple Music Jazz", imageName: "smoothjazz")
    ]
    
    static var stations: [RadioModel] = [
        RadioModel(title: "'90s Hits Station", description: "Apple Music Hits", imageName: "90shits"),
        RadioModel(title: "2000s Hits Station", description: "Apple Music Hits", imageName: "2000shits"),
        RadioModel(title: "2010s Hits Station", description: "Apple Music Hits", imageName: "2010shits"),
        RadioModel(title: "Chill Station", description: "Apple Music Chill", imageName: "chill"),
        RadioModel(title: "Classic Hits Station", description: "Apple Music Hits", imageName: "classichits"),
        RadioModel(title: "Classic Rock Station", description: "Apple Music Classic Rock", imageName: "classicrock"),
        RadioModel(title: "Golden Age Hip-Hop Station", description: "Apple Music Hip-Hop", imageName: "goldenagehiphop"),
        RadioModel(title: "Lo-Fi Station", description: "Apple Music Chill", imageName: "lofi")
    ]
}
