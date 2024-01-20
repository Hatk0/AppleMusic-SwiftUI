import SwiftUI

struct RadioVerticalView: View {
    @State private var model = RadioModel.stations
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Stations")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.trailing, 250)
                
            
            LazyVGrid(columns: columns) {
                ForEach(model) { model in
                    HStack() {
                        Image(model.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 100)
                            .padding([.top, .bottom], -15)
                        
                        VStack(alignment: .leading) {
                            Text(model.title)
                                .lineLimit(/*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                            Text(model.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, -95)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Divider()
                }
            }
        }
    }
}

struct RadioVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        RadioVerticalView()
    }
}
