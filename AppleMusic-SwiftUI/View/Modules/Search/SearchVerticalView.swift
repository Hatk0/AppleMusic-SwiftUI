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
                .font(.callout)
                .bold()
                .padding(.bottom, -20)
                .padding(.trailing, 210)
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(model) { model in
                    NavigationLink(destination: Text("Details for \(model.title)")) {
                        ZStack {
                            Image(model.imageName)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 180 ,height: 120)
                            
                            Text(model.title)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 75)
                                .padding(.leading, -75)
                        }
                    }
                }
            }
            .padding()
            
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

