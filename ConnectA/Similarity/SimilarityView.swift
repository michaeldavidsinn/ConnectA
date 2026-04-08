//
//  SimilarityView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityView: View {
    @State private var showModal = false
    var body: some View {
        VStack {
            
            //Subtitle
            Text("Your Similarities are...").font(.title2)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            //Button change selected tags
            Button(action: {
                
            }) {
                Text("Still None...").foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12).background(
                        Color.gray
                    )
                    .clipShape(Capsule())
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)}.disabled(true)
            
            Spacer()
            
            //Card stack
            HStack {
                //Left button
                Button(action: {
                    print("Chevron Left Tapped")
                }) {
                    Image(systemName: "chevron.left").foregroundColor(.gray)
                }.disabled(true)
                
                //Question card
                Text("Edit your interests first to get similarity!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 120)
                    .background(Color.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)
                
                //Right Button
                Button(action: {
                    print("Chevron Right Tapped")
                }) {
                    Image(systemName: "chevron.right").foregroundColor(.gray)
                }.disabled(true)
            }
            
            Spacer()
            
            //Button Reset Similarity
            Button(action: {
                showModal = true
            }) {
                Text("Reset Interests")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 1.5)
                    )
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            
        }
        .padding()
        .sheet(isPresented: $showModal) {
            SimilarityModalView()
        }
    }
}

#Preview {
    SimilarityView()
}
