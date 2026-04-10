import SwiftUI

extension Color {
    static let appBackground = Color(red: 0xF2/255.0, green: 0xF2/255.0, blue: 0xF7/255.0)
}

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.appBackground)
    }
}

extension View {
    func appBackground() -> some View {
        self.modifier(AppBackground())
    }
}
