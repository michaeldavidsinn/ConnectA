//
//  TagsModel.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//
import SwiftUI

struct Tag: Codable, Identifiable, Hashable {
    let id = UUID()
    let category: String
    let questions: [String]

    enum CodingKeys: String, CodingKey {
        case category
        case questions
    }
}
