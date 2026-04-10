import SwiftUI

struct ConnectView: View {
    
    var body: some View {
        NavigationStack {
            
            AppBackground {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Connect")
                                .font(.system(size: 34, weight: .bold))
                            
                            Text("Get to know, step by step")
                                .font(.subheadline)
                                .foregroundStyle(.black)
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
                        
                        NavigationLink(destination: SimilarityView().navigationTitle("Spot Similarities")) {
                            ConnectButton(title: "Spot Similarities")
                        }
                        .buttonStyle(.plain)
                        
                        Text("Take it a step further")
                            .font(.headline)
                            .italic()
                            .padding(.top, 10)
                        
                        NavigationLink(destination: RandomQuestionView(selectedLevel: 1).navigationTitle("Get to Know the Basics")) {
                            ConnectButton(title: "Get to Know the Basics")
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: RandomQuestionView(selectedLevel: 2).navigationTitle("Explore Deeper Topics")) {
                            ConnectButton(title: "Explore Deeper Topics")
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: RandomQuestionView(selectedLevel: 3).navigationTitle("Build Meaningful Connection")) {
                            ConnectButton(title: "Build Meaningful Connection")
                        }
                        .buttonStyle(.plain)
                        
                        Spacer(minLength: 20)
                    }
                    .padding(20)
                }
        }
    }
}

// button
private struct ConnectButton: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(
                Capsule()
                    .fill(Color.blue)
            )
    }
}

#Preview {
    ConnectView()
}
