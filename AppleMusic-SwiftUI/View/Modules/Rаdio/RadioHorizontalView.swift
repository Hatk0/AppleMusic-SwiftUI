import SwiftUI

struct RadioHorizontalView: View {
    @State private var model = RadioModel.star
    
    let rows = [
        GridItem(.fixed(280))
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(model) { model in
                    VStack(alignment: .leading) {
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

struct RadioHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        RadioHorizontalView()
    }
}
