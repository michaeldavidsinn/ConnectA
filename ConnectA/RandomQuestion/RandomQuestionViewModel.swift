import Foundation
import Observation

@Observable
class RandomQuestionViewModel {
    
    // variabel + inisialisasi
    private var allQuestions: [RandomQuestion] = []
    var playingQuestions: [RandomQuestion] = []
    var currentQuestion: RandomQuestion?
    var currentLevel: Int = 1
    
    var levelTitle: String {
        switch currentLevel {
        case 1:
            return "Get to Know the Basics"
        case 2:
            return "Explore Deeper Topics"
        case 3:
            return "Build Meaningful Connection"
        default:
            return "ConnectA"
        }
    }
    
    var isFinished: Bool = false
    
    init() {
        loadQuestionsFromJSON()
    }
    
    // import dri json
    private func loadQuestionsFromJSON() {
        if let url = Bundle.main.url(forResource: "RandomQuestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                self.allQuestions = try JSONDecoder().decode([RandomQuestion].self, from: data)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    // dari menu page baru pencet level
    func startLevel(_ level: Int) {
        self.currentLevel = level
        self.isFinished = false
        prepareLevel()
        nextQuestion()
    }
    
    // ambil soal sesuai level
    private func prepareLevel() {
        
        self.playingQuestions = allQuestions.filter { $0.level == currentLevel }
    }
    
    // lanjut next question
    func nextQuestion() {
        
        //questionnya uda abis ato blm
        if playingQuestions.isEmpty {
            // kalo uda abis, langsung finish
            self.isFinished = true
        } else {
            // kalo masih ada, cari question baru
            pickRandom()
        }
    }
    
    // random soal dari json
    private func pickRandom() {
        let randomIndex = Int.random(in: 0..<playingQuestions.count)
        self.currentQuestion = playingQuestions[randomIndex]
        playingQuestions.remove(at: randomIndex)
    }
}
