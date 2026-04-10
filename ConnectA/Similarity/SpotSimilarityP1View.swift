//
//  SpotSimilarityP1View.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SpotSimilarityP1View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var navigateToP2 = false
    @StateObject private var viewModel = SimilarityViewModel()
    private let onFindSimilarity: () -> Void
    
    init(
        viewModel: SimilarityViewModel = SimilarityViewModel(),
        onFindSimilarity: @escaping () -> Void = {}
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onFindSimilarity = onFindSimilarity
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                TagsLayout(spacing: 10) {
                    ForEach(viewModel.allTags, id: \.self) { tag in
                        TagButton(
                            title: tag.category,
                            onTap: {
                                viewModel.togglePlayer1Tag(tag.category)
                            },
                            background: AnyShapeStyle(Color.white),
                            color: AnyShapeStyle(Color.black),
                            isSelected: viewModel.isSelectedByPlayer1(tag.category)
                        )
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
            }
            .navigationDestination(isPresented: $navigateToP2) {
                SpotSimilarityP2View(viewModel: viewModel, onFindSimilarity: onFindSimilarity)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.isPlayer1Ready {
                        Button(action: {
                            navigateToP2 = true
                        }) {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(.blue)
                    } else {
                        Button(action: {
                            navigateToP2 = true
                        }) {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(.gray)
                        .disabled(true)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Spot Similarities")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.black)
                        .padding(.top, 35)
                }
                ToolbarItem(placement: .subtitle) {
                    Text("Player 1")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 5)
                }
                ToolbarItem(placement: .largeTitle) {
                    Text("Choose Interests")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(Color.gray)
                        .padding(.top, 30)
                }
            }
        }
        .presentationDetents([.large])
    }
}

#Preview {
    SpotSimilarityP1View(viewModel: SimilarityViewModel())
}
