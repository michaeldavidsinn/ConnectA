//
//  SimilarityModalView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let selectedTags: [Tag]
    @Binding var currentTag: Tag?
    
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
                ForEach(selectedTags) { tag in
                    TagButton(
                        title: tag.category,
                        onTap: {
                            currentTag = tag
                            dismiss()
                        },
                        background: AnyShapeStyle(Color.blue),
                        color: AnyShapeStyle(Color.white)
                    )
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .presentationDetents([.medium])
        .appBackground()
    }}

#Preview {
    SimilarityModalView(
        selectedTags: [
            Tag(category: "Food", questions: ["Q1"]),
            Tag(category: "Travel", questions: ["Q2"])
        ],
        currentTag: .constant(nil)
    )
}
