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

struct TagView: View {
    let tagName: String
    var body: some View {
        Text(tagName)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 7)
            .padding(.vertical, 9)
            .foregroundColor(.black) // Padding vertikal untuk tinggi
            .background(Color.white)
            .cornerRadius(15)        // Sudut tumpul agar berbentuk tag
            .glassEffect()
    }
}
    
struct BrokenView: View {
        let tags = ["Animal", "Arts ", "Beverage", "Blind Box", "Book", "Carrer", "Cars", "Exercise", "Fashion", "Food", "Invesment", "Movie", "Music", "Social Media", "Sports", "Studies", "Technology", "Travel","TV Show", "Video Game"]
        
        var body: some View {
            VStack {
                NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                            ForEach(tags, id: \.self) { tag in
                                TagView(tagName: tag)
                            }
                        }
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
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.gray)
                            }
                            ToolbarItem(placement: .subtitle) {
                                Text("Player 1")
                                    .font(.system(size: 30, weight: .bold))
                            }
//                            ToolbarItem(placement: ) {
//                                Text("Player 2")
//                                    .font(.system(size: 30, weight: .bold))
//                            }
                        }
                    }
                }
            }
        }
    }


#Preview {
    BrokenView()
}

