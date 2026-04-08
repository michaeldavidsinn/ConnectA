//
//  CongratulationsView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct CongratulationsView: View {
    let bodyText = "You have finished this section. You may level up to explore deeper topics if you feel comfortable."
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Get to Know the Basics")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    CongratulationsView()
}
