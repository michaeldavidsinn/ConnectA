//
//  SpotSimilarityP1View.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

// BrokenView.swift
// DEBUGGING EXERCISE: This file has 3 intentional errors
//
// Instructions:
// 1. Uncomment the code below (select lines and press Cmd + /)
// 2. Build the project (Cmd + B)
// 3. Find and fix all 3 errors using the error messages

import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
 
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let maxWidth = proposal.width ?? 0
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0
 
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
 
            // Kalau tidak muat di baris ini, pindah ke baris baru
            if currentX + size.width > maxWidth, currentX > 0 {
                currentX = 0
                currentY += rowHeight + spacing
                rowHeight = 0
            }
 
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
 
        return CGSize(width: maxWidth, height: currentY + rowHeight)
    }
 
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        var currentX = bounds.minX
        var currentY = bounds.minY
        var rowHeight: CGFloat = 0
 
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
 
            if currentX + size.width > bounds.maxX, currentX > bounds.minX {
                currentX = bounds.minX
                currentY += rowHeight + spacing
                rowHeight = 0
            }
 
            subview.place(
                at: CGPoint(x: currentX, y: currentY),
                proposal: .unspecified
            )
 
            currentX += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}

struct TagView: View {
    let tagName: String
    var body: some View {
        Text(tagName)
            .font(.system(size: 20))
            .fontWeight(.medium)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .foregroundColor(.black) // Padding vertikal untuk tinggi
            .background(Color.white)
            .cornerRadius(15)        // Sudut tumpul agar berbentuk tag
            .glassEffect()
    }
}
    
struct SpotSimilarityP1View: View {
        let tags = ["Animal", "Arts ", "Beverage", "Blind Box", "Book", "Carrer", "Cars", "Exercise", "Fashion", "Food", "Invesment", "Movie", "Music", "Social Media", "Sports", "Studies", "Technology", "Travel","TV Show", "Video Game"]
        
        var body: some View {
            VStack {
                NavigationStack {
                    ScrollView {
                        FlowLayout(spacing: 10) {
                            ForEach(tags, id: \.self) { tag in
                                TagView(tagName: tag)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 16)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Image(systemName: "chevron.left")
                                Text("Tombol Back")
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "arrow.right")
                                Text("Kanan")
                            }
                            ToolbarItem(placement: .principal) {
                                Text("Spot Similarities")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(Color.black)
                                    .padding(.top, 10)
                            }
                            ToolbarItem(placement: .subtitle) {
                                Text("Player 1")
                                    .font(.system(size: 25, weight: .bold))
                                    .padding(.top, 5)
                            }
                            ToolbarItem(placement: .largeTitle) {
                                Text("Choose Interests")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(Color.gray)
                                    .padding(.top, 10)
                            }
                        }
                    }
                }
            }
        }
    }


#Preview {
    SpotSimilarityP1View()
}

