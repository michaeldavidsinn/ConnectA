//
//  SimilarityView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityView: View {
    var body: some View {
        VStack {
            
            //Subtitle
            Text("Your Similarities are...").font(.title2)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            //Button change selected tags
            Button("Still None") {
                
            }.disabled(true).foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 12).background(
                    Color.gray
            )
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)

            Spacer()
            HStack {
                Button(action: {
                    print("Chevron Left Tapped")
                }) {
                    Image(systemName: "chevron.left").foregroundColor(.black)
                    
                }
                Text("Edit your interests first to get similarity!")
                Button(action: {
                    print("Chevron Right Tapped")
                }) {
                    Image(systemName: "chevron.right").foregroundColor(.black)
                }
            }
            Spacer()
            Button("Reset Intrests") {
                
            }

        }
        .padding()
    }
}

#Preview {
    SimilarityView()
}
