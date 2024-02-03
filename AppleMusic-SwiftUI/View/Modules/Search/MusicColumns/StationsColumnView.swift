import SwiftUI

struct StationsColumnView: View {
    var station: RadioModel
    
    var body: some View {
        HStack {
            Image(station.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(station.title)
                    .font(.system(size: 16, weight: .medium))
                Text(station.description)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                // Action
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

struct StationsColumnView_Previews: PreviewProvider {
    static var previews: some View {
        StationsColumnView(station: RadioModel(title: "'90s Hits Station", description: "Apple Music Hits", imageName: "90shits"))
    }
}
