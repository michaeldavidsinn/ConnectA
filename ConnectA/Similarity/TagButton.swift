//
//  TagButton.swift
//  ConnectA
//
//  Created by Bryan Samuel on 09/04/26.
//

import SwiftUI

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
