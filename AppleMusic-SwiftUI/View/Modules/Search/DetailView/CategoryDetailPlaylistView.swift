import SwiftUI

struct CategoryDetailPlaylistView: View {
    @State private var playlistsModel = RadioModel.categoriesPlaylistsDetail
    @Environment(\.colorScheme) var colorScheme
    
    var playlistsText: String {
        return colorScheme == .dark ? "Dark Playlists" : "Light Playlists"
    }
    
    let rowsPlaylists = [
        GridItem(.fixed(280))
    ]
    
    var body: some View {
        Button {
            print("Tap")
        } label: {
            HStack {
                Text("Playlists")
                    .font(.system(.title3, weight: .semibold))
                    .foregroundColor(
                        colorScheme == .dark ? .white : .black
                    )

                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .tint(.gray)
            }
        }
        .padding(.trailing, 260)
        .padding(.top, -230)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rowsPlaylists, spacing: 2) {
                ForEach(playlistsModel) { model in
                    VStack(alignment: .leading) {
                        Image(model.imageName)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 160, height: 160)
                            .lineLimit(1)
                        
                        VStack(alignment: .leading) {
                            Text(model.title)
                                .font(.system(size: 14))
                            Text(model.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .padding(.trailing, -20)
                }
            }
        }
        .padding(.top, -240)
        
        
        Spacer()
            .frame(height: 80)
    }
}

struct CategoryDetailPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailPlaylistView()
    }
}
