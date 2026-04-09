import Foundation

class RandomQuestionService {
    
    static func loadQuestions() -> [RandomQuestion] {
        if let url = Bundle.main.url(forResource: "RandomQuestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([RandomQuestion].self, from: data)
                return decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return [] 
    }
}
