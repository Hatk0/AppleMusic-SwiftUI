import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    RadioHorizontalView()
                    RadioVerticalView()
                        .padding(.top, -435)
                }
                .padding(.top, -50)
            }
            .navigationTitle("Radio")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
