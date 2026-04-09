import SwiftUI

struct ConnectView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Connect")
                            .font(.system(size: 34, weight: .bold))
                        
                        Text("Get to know, step by step")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(.top, 5)
                    
                    Image("CloseEnvelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity)
                    
                    
                    Text("Find what connects you")
                        .font(.headline)
                        .italic()
                    
                    NavigationLink(destination: SimilarityView()) {
                        PrimaryButton(title: "Start Easy, No Pressure")
                    }
                    .buttonStyle(.plain)
                    
                    Text("Take it a step further")
                        .font(.headline)
                        .italic()
                        .padding(.top, 10)
                    
                    NavigationLink(destination: ClickToOpenView()) {
                        PrimaryButton(title: "Get to Know the Basics")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: ClickToOpenView()) {
                        PrimaryButton(title: "Explore Deeper Topics")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: ClickToOpenView()) {
                      PrimaryButton(title: "Build Meaningful Connection")
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
                .padding(20)
            }
        }
        .appBackground() 
    }
}

//dummy
struct SimilarityView: View {
    var body: some View {
        Text("Similarity View")
    }
}

struct ClickToOpenView: View {
    var body: some View {
        Text("Next View")
    }
}

#Preview {
    ConnectView()
}
