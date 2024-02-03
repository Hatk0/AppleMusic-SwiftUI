import SwiftUI

struct ListView: View {
    @State private var selectedID: Set<UUID> = []
    @State private var listModel = LibraryListModel.listPanel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List(selection: $selectedID) {
                ForEach(listModel, id: \.id) { model in
                    ListRow(listModel: model).tag(model)
                }.onMove { IndexSet, index in
                    self.listModel.move(fromOffsets: IndexSet, toOffset: index)
                }
            }
            .listStyle(.inset)
            .environment(\.editMode, .constant(.active))
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        } label: {
                            Button {
                                dismiss()
                            } label: {
                                Text("Done")
                            }
                            .tint(.red)
                    }
                        .navigationTitle("Media")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
