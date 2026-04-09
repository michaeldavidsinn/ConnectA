//
//  OpenedQuestionView.swift
//  ConnectA
//
//  Created by Joy Thenarianto on 09/04/26.
//

import SwiftUI

struct OpenedQuestionView: View {
    let questionText = "Did you grow up around here, or somewhere completely different?"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    
                    Spacer()
                    ZStack {
                        
                        Image("OpenEnvelope")
                            .resizable()
                            .frame(width: 310, height: 430)
                            .cornerRadius(10)
                            .offset(y: -35)

                        
                        VStack {
                            Text(questionText)
                                .font(.system(size: 22, weight: .medium, design: .rounded))
                                .multilineTextAlignment(.center)
                                .padding(40)
                        }
                        .frame(width: 320, height: 220)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.1), radius: 15)
                        .offset(y: -30)
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
                            .clipShape(Capsule())
                            .cornerRadius(14)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
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
    OpenedQuestionView()
}
