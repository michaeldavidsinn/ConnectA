//
//  SpotSimilarityP2View.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SpotSimilarityP2View: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: SimilarityViewModel
    private let onFindSimilarity: () -> Void

    init(
        viewModel: SimilarityViewModel,
        onFindSimilarity: @escaping () -> Void = {}
    ) {
        self.viewModel = viewModel
        self.onFindSimilarity = onFindSimilarity
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                TagsLayout(spacing: 10) {
                    ForEach(viewModel.allTags, id: \.self) { tag in
                        TagButton(
                            title: tag.category,
                            onTap: {
                                viewModel.togglePlayer2Tag(tag.category)
                            },
                            background: AnyShapeStyle(
                                LinearGradient(
                                    colors: [.white],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            ),
                            color: AnyShapeStyle(Color.black),
                            isSelected: viewModel.isSelectedByPlayer2(tag.category)
                        )
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
            }

            Button(action: {
                viewModel.computeSimilarity()
                onFindSimilarity()
            }) {
                Text("Find Similarity")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 60)
                    .background(viewModel.isPlayer2Ready ? Color.blue : Color.gray)
                    .cornerRadius(50)
            }
            .disabled(!viewModel.isPlayer2Ready)
            .padding(.bottom, 30)
            .padding(.top, 16)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Spot Similarities")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color.black)
                    .padding(.top, 30)
            }
            ToolbarItem(placement: .subtitle) {
                Text("Player 2")
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
}

#Preview {
    NavigationStack {
        SpotSimilarityP2View(viewModel: SimilarityViewModel())
    }
}
