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
    
struct BrokenView: View {
        
        var body: some View {
            VStack {
                NavigationStack {
                    Text("tes")
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


#Preview {
    BrokenView()
}

