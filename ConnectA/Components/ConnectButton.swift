import SwiftUI

struct ConnectButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(
                Capsule()
                    .fill(Color(red: 0.0, green: 145/255, blue: 1.0))
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.6), lineWidth: 2)
                    .blur(radius: 3)
            )
            .overlay(
                Capsule()
                    .stroke(Color.white.opacity(0.25), lineWidth: 10)
                    .blur(radius: 14)
            )
    }
}

