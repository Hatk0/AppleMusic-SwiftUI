import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("blackholesun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .cornerRadius(5)
                
                Text("Black Hole Sun")
                    .font(.title3)
                    .fontWeight(.regular)
                
                Spacer(minLength: 0)
                
                Button {
                    // Action
                } label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Button {
                    // Action
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 70)
        .background(
            VStack(spacing: 0, content: {
                BlurView()
                
                Divider()
            })
        )
        .offset(y: -49)
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}
