import SwiftUI

struct CategoryDetailView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Hits")
                        .font(.system(.title, design: .default, weight: .heavy))
                        .padding(.top, -50)
                        .padding(.trailing, 310)
                    
                    CategoryDetailHorizontalView()
                        .padding(.top, -40)
                }
            }
        }
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView()
    }
}
