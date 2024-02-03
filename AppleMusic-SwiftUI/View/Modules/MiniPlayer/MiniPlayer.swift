import SwiftUI

struct MiniPlayer: View {
    var animation: Namespace.ID
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .first?
        .windows
        .first?
        .safeAreaInsets
    
    @Binding var expand: Bool
    @State private var offset: CGFloat = 0
    @State private var isPlaying = false
    
    @State private var playerDuration: TimeInterval = 100
    let maxDuration = TimeInterval(322)
    
    @State private var volume: Double = 0.3
    var maxVolume: Double = 1
    
    @State private var sliderValue: Double = 10
    var maxSliderValue: Double = 100
    
    @State private var color: Color = .white
    
    var normalFillColor: Color { color.opacity(0.5) }
    var emptyColor: Color { color.opacity(0.3) }
    
    @ObservedObject var audioManager = AudioManager.shared
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    expand.toggle()
                }
            } label: {
                Capsule()
                    .fill(.gray)
                    .frame(width: expand ? 30 : 0, height: expand ? 4 : 0)
                    .opacity(expand ? 1 : 0)
                    .padding(.top, expand ? safeArea?.top : 0)
                    .padding(.vertical, expand ? 30 : 0)
            }
            
            HStack(spacing: 15) {
                if expand {
                    Spacer(minLength: 0)
                }
                
                Image("blackholesun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 45, height: expand ? height : 45)
                    .cornerRadius(5)
                
                if !expand {
                    Text("Black Hole Sun")
                        .font(.title3)
                        .fontWeight(.regular)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !expand {
                    Button {
                        audioManager.playPause()
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
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
            }
            .padding(.horizontal)
            
            VStack {
                
                Spacer()
                
                HStack {
                    if expand {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Black Hole Sun")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .opacity(expand ? 1 : 0)
                                .offset(x: expand ? 0 : -20)
                                .animation(.easeOut(duration: 0.3).delay(0.3), value: 1)

                            Text("Soundgarden")
                                .foregroundColor(.gray)
                                .opacity(expand ? 1 : 0)
                                .offset(x: expand ? 0 : -20)
                                .animation(.easeOut(duration: 0.3).delay(0.2), value: 1)
                        }
                        .padding([.leading, .trailing], 3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.opacity)
                        .animation(.easeOut(duration: 0.3).delay(0.2), value: 1)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                            .padding(12)
                            .background {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .environment(\.colorScheme, .dark)
                            }
                    }

                }
                .padding()
                .padding(.top)
                .padding(.bottom, -10)
                
                MusicProgressSlider(value: $audioManager.currentTime, inRange: TimeInterval.zero...maxDuration, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 32) { started in
                    if !started {
                        audioManager.seek(to: audioManager.currentTime)
                    }
                }
                .frame(height: 40)
                .padding([.leading, .trailing], 20)
                
                HStack {
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button {
                        audioManager.playPause()
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
            
                Spacer(minLength: 0)
                
                VolumeSlider(value: $volume, inRange: 0...maxVolume, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in }
                .padding()
                .frame(height: 30)
                
                HStack(spacing: 22) {
                    Button  {
                        // Action
                    } label: {
                        Image(systemName: "quote.bubble")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button  {
                        // Action
                    } label: {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button  {
                        // Action
                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .onAppear {
            audioManager.playSound(sound: "BlackHoleSun", type: "mp3")
            
        }
        .frame(maxHeight: expand ? .infinity : 70)
        .background(
            VStack(spacing: 0) {
                BlurView()
                
                Divider()
            }
                .onTapGesture(perform: {
                    withAnimation(.spring()) { expand = true }
                })
        )
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
        audioManager.seek(to: TimeInterval(value.location.x / UIScreen.main.bounds.width) * audioManager.duration)
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            if value.translation.height > height {
                expand = false
            }
            
            offset = 0
        }
    }
}
