//
//  TagService.swift
//  ConnectA
//
//  Created by Bryan Samuel on 09/04/26.
//
import Foundation

func loadTagsFromJSON() -> [Tag] {
    guard let url = Bundle.main.url(forResource: "SimilarityQuestions", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let tags = try? JSONDecoder().decode([Tag].self, from: data)
    else {
        return []
    }
    
    return tags
}
