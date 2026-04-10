//
//  RandomQuestionModel.swift
//  ConnectA
//
//  Created by Michael David Sin on 06/04/26.
//

import Foundation

struct RandomQuestion: Codable, Identifiable {
    let id: Int
    let level: Int
    let question: String
}
