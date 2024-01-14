import SwiftUI

struct ListRow: View {
    
    var listModel: LibraryListModel
    
    var body: some View {
        HStack {
            listModel.image
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
            
            Text(listModel.title)
                .font(.title2)
            Spacer()
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(listModel: LibraryListModel.listPanel[11])
    }
}
