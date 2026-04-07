//
//  OpenedQuestionView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct OpenedQuestionView: View {

    let questionText = "Did you grow up around here, or somewhere completely different?"
    
    var body: some View {
        ZStack {
           
            Color(uiColor: .systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
        
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text("Get to Know the Basics")
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.left").opacity(0)
                }
                .padding(.horizontal)
                
                Spacer()
                
                ZStack {
                    
                    Image("OpenEnvelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320)
                        .opacity(0.4)
                    
                    // Question Card
                    VStack {
                        Text(questionText)
                            .font(.system(size: 22, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .padding(40)
                    }
                    .frame(width: 300, height: 220)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                    .offset(y: -40)
                }
                
                Spacer()
                
                
                Button(action: {

                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    OpenedQuestionView()
}
