//
//  SimilarityView.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import SwiftUI

struct SimilarityView: View {
    @StateObject private var viewModel = SimilarityViewModel()
    
    @State private var showModal = false
    @State private var currentTag: Tag?
    @State private var currentQuestionIndex: Int = 0
    @State private var navigateToP1 = false
    
    init(viewModel: SimilarityViewModel = SimilarityViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            
            //Subtitle
            Text("Your Similarities are...").font(.title2)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            //Button change selected tags
            Button(action: {
                showModal = true
            }) {
                Text(currentTag?.category ?? "Still None...").foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12).background(currentTag != nil ? Color.blue : Color.gray)
                    .clipShape(Capsule())
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)}.disabled(false).disabled(viewModel.selectedTags.isEmpty)
            
            Spacer()
            
            //Card stack
            HStack {
                //Left button
                Button(action: {
                    if currentQuestionIndex > 0 {
                        currentQuestionIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(currentQuestionIndex == 0 ? Color.gray : Color.black)
                }
                .disabled(currentQuestionIndex == 0)
                Spacer()
                
                //Question card
                Text(currentTag?.questions[safe: currentQuestionIndex] ?? "Edit your interests first to get similarity!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 120)
                    .background(Color.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)
                Spacer()
                
                //Right Button
                Button(action: {
                    if let tag = currentTag,
                       currentQuestionIndex < tag.questions.count - 1 {
                        currentQuestionIndex += 1
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(currentQuestionIndex >= (currentTag?.questions.count ?? 0) - 1 ? Color.gray : Color.black)
                }
                .disabled(
                    currentTag == nil ||
                    currentQuestionIndex >= (currentTag?.questions.count ?? 0) - 1
                )
            }
            
            Spacer()
            
            //Button Reset Similarity
            Button(action: {
                viewModel.reset()
                navigateToP1 = true

            }) {
                Text("Reset Interests")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 1.5)
                    )
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
        }
        .sheet(isPresented: $navigateToP1, onDismiss: {
            currentTag = viewModel.selectedTags.first
            currentQuestionIndex = 0
        }) {
            SpotSimilarityP1View(viewModel: viewModel, onFindSimilarity: {
                navigateToP1 = false
                currentTag = viewModel.selectedTags.first
                currentQuestionIndex = 0
            })
        }

        .onAppear {
            if viewModel.selectedTags.isEmpty {
                // kalau belum ada data → langsung buka flow P1
                navigateToP1 = true
            } else {
                // kalau sudah ada → langsung buka modal pilih tag
                showModal = true
                currentTag = viewModel.selectedTags.first
            }
        }
        .onChange(of: currentTag) {
            currentQuestionIndex = 0
        }
        .padding()
        .sheet(isPresented: $showModal) {
            SimilarityModalView(
                selectedTags: Array(viewModel.selectedTags).sorted { $0.category < $1.category },
                        currentTag: $currentTag
            )
        }.appBackground()
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

//extension SimilarityView {
//    
//    func loadDummyData() {
//        // Dummy allTags (anggap dari JSON)
//        let dummyTags: [Tag] = [
//            Tag(category: "Blind Box", questions: [
//                "What is your favourite blind box series?",
//                "Do you ever get any secrets?",
//                "What do you do with your blind boxes?"
//            ]),
//            Tag(category: "Career", questions: [
//                "Passion first or security first?",
//                "Tell me about your job!"
//            ]),
//            Tag(category: "Food", questions: [
//                "Spicy or non-spicy?",
//                "Favorite cuisine?"
//            ])
//        ]
//        
//        viewModel.allTags = dummyTags
//        
//        // Dummy selected tags (SET)
//        viewModel.selectedTags = [
//            dummyTags[0],
//            dummyTags[2]
//        ]
//        
//        // Ambil salah satu sebagai active
//        currentTag = viewModel.selectedTags.first
//    }
//}
//
//extension Array {
//    subscript(safe index: Int) -> Element? {
//        indices.contains(index) ? self[index] : nil
//    }
//}

//#Preview {
//    SimilarityView()
//}

#Preview {

    return SimilarityView()
}
