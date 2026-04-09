//
//  ClickToOpenView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct ClickToOpenView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isOpen = false
    
    var body: some View {
        NavigationStack {
            
            if (isOpen == true) {
                Text("Click To Open!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .offset(x: 0, y: 10)
            } else {
              
            }
            
            ZStack {
                
                Image(isOpen ? "CloseEnvelopeFrame" : "OpenEnvelopeFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 420, height: 420)
                    .offset(y:-40)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isOpen.toggle()
                        }
                    }
            }
            
            .navigationTitle(Text("Get to Know the Basics"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ClickToOpenView()
}
