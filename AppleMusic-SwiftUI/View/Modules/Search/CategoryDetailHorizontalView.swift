import SwiftUI

struct CategoryDetailHorizontalView: View {
    @State private var featuredModel = RadioModel.categoriesFeaturedDetail
    @State private var playlistsModel = RadioModel.categoriesPlaylistsDetail
    @Environment(\.colorScheme) var colorScheme
       
    var playlistsText: String {
        return colorScheme == .dark ? "Dark Playlists" : "Light Playlists"
    }
    
    let rowsFeatured = [
        GridItem(.fixed(280))
    ]
    
    let rowsPlaylists = [
        GridItem(.fixed(280))
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rowsFeatured) {
                    ForEach(featuredModel) { model in
                        VStack(alignment: .leading) {
                            Divider()
                            
                            Text("Featured Station".uppercased())
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text(model.title)
                                .font(.title3)
                            Text(model.description)
                                .font(.title3)
                                .foregroundColor(.gray)
                            Image(model.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
                
                Divider()
                    .padding(.top, -50)
            }
            
            Button {
                print("Tap")
            } label: {
                HStack {
                    Text("Playlists")
                        .font(.system(.title3, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .tint(.gray)
                }
            }
            .padding(.top, -220)
            .padding(.trailing, 260)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rowsPlaylists) {
                    ForEach(playlistsModel) { model in
                        HStack() {
                            Image(model.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 120, height: 120)
                                .padding(.trailing, 100)
                                .padding([.top, .bottom], -15)
                            
                            VStack(alignment: .leading) {
                                Text(model.title)
                                Text(model.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, -95)
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
            .padding(.top, -280)
        }
    }
}

struct CategoryDetailHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailHorizontalView()
    }
}
