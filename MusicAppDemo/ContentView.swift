
import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var progress: Double = 0.35

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 30) {

                // Header
                HStack {
                    Image(systemName: "chevron.down")
                    Spacer()
                    Text("NOW PLAYING")
                        .font(.caption)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .foregroundStyle(.white)

                Spacer()

                // Album Cover
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(
                                colors: [.purple, .blue, .black],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Image(systemName: "waveform")
                        .font(.system(size: 100))
                        .foregroundStyle(.white.opacity(0.9))
                }
                .frame(height: 320)
                .padding(.horizontal, 20)
                .shadow(color: .purple.opacity(0.4), radius: 20)

                // Song Details
                VStack(spacing: 8) {
                    Text("Midnight Dreams")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Text("The Weeknd")
                        .font(.title3)
                        .foregroundStyle(.gray)
                }

                // Progress Bar
                VStack(spacing: 8) {
                    Slider(value: $progress, in: 0...1)
                        .tint(.purple)

                    HStack {
                        Text("1:24")
                        Spacer()
                        Text("3:58")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                }
                .padding(.horizontal, 25)

                // Playback Controls
                HStack(spacing: 35) {
                    Button {
                        progress = max(0, progress - 0.1)
                    } label: {
                        Image(systemName: "backward.end.fill")
                            .font(.title2)
                    }

                    Button {
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(.black)
                            .frame(width: 75, height: 75)
                            .background(.white)
                            .clipShape(Circle())
                    }

                    Button {
                        progress = min(1, progress + 0.1)
                    } label: {
                        Image(systemName: "forward.end.fill")
                            .font(.title2)
                    }
                }
                .foregroundStyle(.white)

                Spacer()

                // Bottom Controls
                HStack {
                    Image(systemName: "airplayaudio")
                    Spacer()
                    Image(systemName: "heart")
                    Spacer()
                    Image(systemName: "list.bullet")
                }
                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.horizontal, 35)
            }
            .padding(.top, 20)
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    ContentView()
}

