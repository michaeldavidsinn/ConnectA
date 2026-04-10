//
//  SimilarityViewModel.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//
import SwiftUI
import Combine

class SimilarityViewModel: ObservableObject {
    @Published var allTags: [Tag] = []
    @Published var selectedTags: Set<Tag> = []
    @Published var player1SelectedTags: Set<String> = []
    @Published var player2SelectedTags: Set<String> = []

    init() {
        loadTags()
    }
    
    func loadTags() {
        allTags = loadTagsFromJSON()
    }
    var isPlayer1Ready: Bool {
        !player1SelectedTags.isEmpty
    }
        
    var isPlayer2Ready: Bool {
        !player2SelectedTags.isEmpty
    }

    func togglePlayer1Tag(_ tag: String) {
        if player1SelectedTags.contains(tag) {
            player1SelectedTags.remove(tag)
        } else {
            player1SelectedTags.insert(tag)
        }
    }
    
    func togglePlayer2Tag(_ tag: String) {
        if player2SelectedTags.contains(tag) {
            player2SelectedTags.remove(tag)
        } else {
            player2SelectedTags.insert(tag)
        }
    }
        
    func isSelectedByPlayer1(_ tag: String) -> Bool {
        player1SelectedTags.contains(tag)
    }
        
    func isSelectedByPlayer2(_ tag: String) -> Bool {
        player2SelectedTags.contains(tag)
    }
        
    func reset() {
        player1SelectedTags = []
        player2SelectedTags = []
        selectedTags = []
    }
    
    func computeSimilarity() {
        let similarCategories = player1SelectedTags.intersection(player2SelectedTags)
        selectedTags = Set(allTags.filter { similarCategories.contains($0.category) })
    }
}
