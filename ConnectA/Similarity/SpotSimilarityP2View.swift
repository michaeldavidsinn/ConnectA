//
//  SpotSimilarityP2View.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI
    
struct SpotSimilarityP2View: View {
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
                            ToolbarItem(placement: .principal) {
                                Text("Spot Similarities")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(Color.black)
                                    .padding(.top, 10)
                            }
                            ToolbarItem(placement: .subtitle) {
                                Text("Player 2")
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
                    Button("Find Similarity") {
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 60)
                    .background(Color.gray)
                    .cornerRadius(50)
                    .padding(.bottom, 30)
                }
            }
        }
    }


#Preview {
    SpotSimilarityP2View()
}
