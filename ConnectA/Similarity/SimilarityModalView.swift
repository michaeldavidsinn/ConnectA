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
                    TagButton(title: tag){
                        dismiss()
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .presentationDetents([.medium])
    }}


struct TagButton: View {
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            print("\(title) tapped")
            onTap()
        }) {
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
        }
        .buttonStyle(.plain)
    }
}

struct TagsLayout: Layout {
    
    var spacing: CGFloat = 10
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize { // Dipanggil auto oleh swiftui
        let maxWidth = proposal.width ?? 0
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for view in subviews {
            let size = view.sizeThatFits(.unspecified)
            
            if x + size.width > maxWidth {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }
        
        return CGSize(width: maxWidth, height: y + rowHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) { // Dipanggil auto oleh swiftui
        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0
        
        for view in subviews {
            let size = view.sizeThatFits(.unspecified)
            
            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += rowHeight + spacing
                rowHeight = 0
            }
            
            view.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(size)
            )
            
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }
    }
}

#Preview {
    SimilarityModalView()
}
