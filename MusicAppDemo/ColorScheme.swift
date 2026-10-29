import SwiftUI

struct ColorScheme: View {
    @State private var isDarkMode = false

    var body: some View {
        VStack(spacing: 25) {
            Text("Color Scheme")
                .font(.largeTitle)
                .fontWeight(.bold)

            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                .font(.system(size: 70))
                .foregroundStyle(isDarkMode ? .purple : .orange)

            Text(isDarkMode ? "Dark Mode" : "Light Mode")
                .font(.title2)
                .fontWeight(.semibold)

            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding(.horizontal, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isDarkMode ? .black : .white)
        .foregroundStyle(isDarkMode ? .white : .black)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ColorScheme()
}
