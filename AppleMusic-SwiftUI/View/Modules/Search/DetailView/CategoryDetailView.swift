import SwiftUI

struct CategoryDetailView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    CategoryDetailFeatureView()
                        .padding(.top, -10)
                    
                    CategoryDetailPlaylistView()
                }
            }
        }
        .navigationTitle("Hits")
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView()
    }
}
