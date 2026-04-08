//
//  SimilarityModalView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            // TODO: Add Tag Buttons
            Text("Reset Interests?")
                .font(.title2)
                .fontWeight(.bold)
        }.presentationDetents([.medium])
    }
}

#Preview {
    SimilarityModalView()
}
