//
//  SimilarityModalView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let tags: [String] = ["Arts and Crafts", "Fashion", "TV Show","LALLALALA", "lol","OIOIOIOIOIOIOIO"]
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Exit Button
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 36, height: 36)
                        .background(
                            Circle()
                                .fill(Color.gray.opacity(0.15))
                        )
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Tag Buttons
            TagsLayout(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    TagButton(
                        title: tag,
                        onTap: {
                            dismiss()
                        },
                        background: AnyShapeStyle(
                            LinearGradient(
                                colors: [.blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        ), color: AnyShapeStyle(.white)
                    )
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .presentationDetents([.medium])
    }}

#Preview {
    SimilarityModalView()
}
