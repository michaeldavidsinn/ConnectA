import SwiftUI

struct CongratulationsView: View {
    
    var finishedLevel: Int
    
    var bodyText: String {
        if finishedLevel == 3 {
            return "You have finished this section. Hope you now know each other better!"
        } else {
            return "You have finished this section. You may level up to explore deeper topics if you feel comfortable."
        }
    }
    
    @Environment(\.dismiss) var dismiss
    
    var navTitle: String {
        switch finishedLevel {
        case 1: return "Get to Know the Basics"
        case 2: return "Explore Deeper Topics"
        case 3: return "Build Meaningful Connection"
        default: return "Congratulations"
        }
    }
    
    var body: some View {
        ZStack {
            
            
            VStack(spacing: 30) {
                Spacer()
                
                Text("Congratulations!")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 8)
                
                Text(bodyText)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.black.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .lineSpacing(4)
                
                Spacer()
                Spacer()
            }
        }
        // TOOLBAR DEFAULT
//        .navigationTitle(navTitle)
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .fontWeight(.semibold)
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        CongratulationsView(finishedLevel: 3)
    }
}
