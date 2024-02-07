import SwiftUI

struct TabBarView: View {
    @State var expand = false
    @Namespace var animation 
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "play.square.stack")
                        Text("Library")
                    }
                RadioView()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                SearchRepresentable()
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search UIKit")
                    }
            }
            .tint(.red)
            
            MiniPlayer(animation: animation, expand: $expand)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
