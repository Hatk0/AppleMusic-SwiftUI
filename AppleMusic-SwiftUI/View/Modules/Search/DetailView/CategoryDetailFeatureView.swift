import SwiftUI

struct CategoryDetailFeatureView: View {
    @State private var featuredModel = RadioModel.categoriesFeaturedDetail
    
    let rowsFeatured = [
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
        }
    }
}

struct CategoryDetailHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailFeatureView()
    }
}
