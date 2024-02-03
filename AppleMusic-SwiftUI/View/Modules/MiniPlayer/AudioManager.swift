import Foundation
import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool = false
    var timer: Timer?
    
    @Published var currentTime: TimeInterval = 0.0
    @Published var duration: TimeInterval = 0.0
    
    func playPause() {
        if isPlaying {
            audioPlayer?.pause()
            timer?.invalidate()
        } else {
            audioPlayer?.play()
            startTimer()
        }
        isPlaying.toggle()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            self?.currentTime = self?.audioPlayer?.currentTime ?? 0.0
        }
    }
    
    func seek(to time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
                duration = audioPlayer?.duration ?? 0.0
            } catch {
                print("Couldn't find and play the sound file: \(error.localizedDescription)")
            }
        }
    }
}
