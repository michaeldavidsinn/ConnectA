import Foundation

struct RandomQuestion: Codable, Identifiable {
    let id: Int
    let level: Int
    let question: String
}
