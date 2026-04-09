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
}
