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
                .font(.system(.body, weight: .heavy))
                .padding(.bottom, -20)
                .padding(.trailing, 210)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(model) { model in
                    NavigationLink(destination: CategoryDetailView()) {
                        ZStack {
                            Image(model.imageName)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 180, height: 120)
                            
                            Text(model.title)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 85)
                                .padding(.leading, -75)
                        }
                    }
                }
            }
            .padding()
            .padding([.leading ,.trailing], -5)
            
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
