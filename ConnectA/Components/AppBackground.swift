import SwiftUI

extension Color {
    static let appBackground = Color(
        red: 242 / 255,
        green: 242 / 255,
        blue: 247 / 255
    )
}

struct AppBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.appBackground)
    }
}

extension View {
    func appBackground() -> some View {
        modifier(AppBackgroundModifier())
    }
}
