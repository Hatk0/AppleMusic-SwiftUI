import SwiftUI

struct SearchVerticalView: View {
    @State private var model = RadioModel.categories
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Browse Categories")
                .font(.system(size: 18, weight: .bold))
                .padding(.top, 5)
                .padding(.trailing, 200)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(model) { model in
                    NavigationLink(destination: CategoryDetailView()) {
                        ZStack {
                            Image(model.imageName)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 175, height: 120)
                            
                             VStack(alignment: .leading) {
                                Text(model.title)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.top, 85)
                                    .padding([.leading, .trailing], -75)
                            }
                        }
                    }
                }
            }
            .padding()
            .padding([.leading ,.trailing], -5)
            .padding(.top, -20)
            
            Spacer()
                .frame(height: 80)
        }
    }
}

struct SearchVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchVerticalView()
        }
    }
}
