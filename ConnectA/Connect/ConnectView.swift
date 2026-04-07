import SwiftUI

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
                Image("CloseEnvelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .frame(maxWidth: .infinity)
                
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
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}
#Preview{
    ConnectView()
}



