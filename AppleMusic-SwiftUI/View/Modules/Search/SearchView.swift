import SwiftUI

struct SearchView: View {
    enum Sources: String, CaseIterable, Identifiable {
        case appleMusic = "Apple Music"
        case yourLibrary = "Your Library"
        var id: Sources { self }
    }
    
    @ObservedObject var observedObject = SearchObservableObject()
    @State private var searchTerm = ""
    @State private var searchPlaceholder = "Your Library"
    @State private var selectedSource: Sources = .yourLibrary
    
    var body: some View {
        NavigationView {
            VStack {
                SearchVerticalView()
            }
            .navigationTitle("Search")
            .searchable(text: $searchTerm,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: self.$searchPlaceholder.wrappedValue) {
                Picker("Sources", selection: $selectedSource) {
                    ForEach(Sources.allCases) { source in
                        Text(source.rawValue).tag(source)
                    }
                }
                .onChange(of: selectedSource) { source in
                    if source == .yourLibrary {
                        searchPlaceholder = "Your Library"
                    } else {
                        searchPlaceholder = "Artists, Songs, Lyrics and More"
                    }
                }
                .pickerStyle(.segmented)
                
                // Stations
                ForEach(observedObject.searchResults) { station in
                    StationsColumnView(station: station)
                }
                .onChange(of: searchTerm) { searchTerm in
                    observedObject.updateSearchResults(for: searchTerm)
                }
                
                // Songs
                ForEach(observedObject.searchSongsResults) { song in
                    SongsColumnView(song: song)
                }
                .onChange(of: searchTerm) { searchTerm in
                    observedObject.updateSongsSearchResults(for: searchTerm)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
