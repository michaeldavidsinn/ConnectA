import SwiftUI

extension Color {
    static let appBackground = Color(
        red: 230 / 255,
        green: 230 / 255,
        blue: 240 / 255
    )
}

struct AppBackground<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            content
        }
    }
}
