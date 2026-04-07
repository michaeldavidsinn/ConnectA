import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: UInt64
        switch hex.count {
        case 6: // 00B4D8
            (r, g, b) = ((int >> 16), (int >> 8 & 0xFF), (int & 0xFF))
        default:
            (r, g, b) = (1, 1, 1)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}

struct ConnectView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // jduul
                VStack(alignment: .leading, spacing: 6) {
                    Text("Connect")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Get to know, step by step")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
                
                // amplop
                
                // similarity
                Text("Find what connects you")
                    .font(.headline)
                    .italic()
                
                ConnectButton(title: "Start Easy, No Pressure")
                
                // level 1,2,3
                Text("Take it a step further")
                    .font(.headline)
                    .italic()
                    .padding(.top, 10)
                
                ConnectButton(title: "Get to Know the Basics")
                ConnectButton(title: "Explore Deeper Topics")
                ConnectButton(title: "Build Meaningful Connection")
                
                Spacer()
            }
            .padding(20)
        }
        .background(Color(.systemGray6))
    }
}

struct ConnectButton: View {
    var title: String
    
    var body: some View {
        Button {
            // action
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    Color(hex: "00B4D8")
                )
                .clipShape(Capsule())
        }
    }
}

#Preview{
    ConnectView()
}



