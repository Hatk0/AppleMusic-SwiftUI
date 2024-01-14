import SwiftUI

struct MainModule: View {
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                    Text("Library")
                }
            Text("Radio")
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Radio")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .tint(.red)
    }
}

struct MainModule_Previews: PreviewProvider {
    static var previews: some View {
        MainModule()
    }
}
