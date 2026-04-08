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
                
            }

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
