//
//  SimilarityModalView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Data jadi array
    let tags: [String] = ["Arts and Crafts", "Fashion", "TV Show","LALLALALA", "lol","OIOIOIOIOIOIOIO"]
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // TODO: Add (X) Button
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal)           }
        // TODO: Add Tag Buttons
        LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
            ForEach(tags, id: \.self) { tag in
                TagButton(title: tag)
            }
        }
        .padding(.horizontal)
        Spacer()
        
            .presentationDetents([.medium])
    }}


struct TagButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color.blue.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .fixedSize() // biar width sesuai konten
    }
}

#Preview {
    SimilarityModalView()
}
