import SwiftUI

struct LibraryView: View {
    @Environment (\.editMode) private var isEdit
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Looking for your music?")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(2)
                Text("The music you purchased from iTunes Store will appear here.")
                    .font(.system(size: 17))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 100)
            }
            .navigationTitle("Media")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Edit") {
                        ListView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
