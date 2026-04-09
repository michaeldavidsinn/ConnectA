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
    let background: AnyShapeStyle
    let color: AnyShapeStyle
    var isSelected: Bool = false

    var body: some View {
        Button(action: {
            print("\(title) tapped")
            onTap()
        }) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(isSelected ? AnyShapeStyle(Color.white) : color)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(isSelected ? AnyShapeStyle(Color.blue) : background)
                .cornerRadius(20)
                .overlay(
                    Capsule().stroke(.white.opacity(0.2), lineWidth: 1)
                )
                .glassEffect()
        }
        
        .buttonStyle(.plain)
    }
}
