import SwiftUI

struct SongsColumnView: View {
    var song: SongsModel
    @Environment(\.colorScheme) var colorScheme
    
    var playlistsText: String {
        return colorScheme == .dark ? "Light ellipsis" : "Dark ellipsis"
    }
    
    var body: some View {
        HStack {
            Image(song.image)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(song.songTitle)
                    .font(.system(size: 16, weight: .medium))
                Text("Song · \(song.performer)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                // Action
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(
                        colorScheme == .dark ? .white : .black
                    )
            }
        }
        .padding()
    }
}

struct SongsColumnView_Previews: PreviewProvider {
    static var previews: some View {
        SongsColumnView(song: SongsModel(image: "modest", songTitle: "Modest", performer: "NEFFEX"))
    }
}
