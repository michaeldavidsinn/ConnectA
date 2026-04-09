import Foundation
import Observation

@Observable
class RandomQuestionViewModel {
    
    // variabel + inisialisasi
    private var allQuestions: [RandomQuestion] = []
    var playingQuestions: [RandomQuestion] = []
    var currentQuestion: RandomQuestion?
    var currentLevel: Int = 1
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
        
        // kalo question abis
        if playingQuestions.isEmpty {
            // kalo level dibawah 3
            if currentLevel < 3 {
               
                currentLevel += 1
                prepareLevel()
                
                // kalo level masih ada soalnya
                if !playingQuestions.isEmpty {
                    pickRandom()
                } else {
                    // kalo level2nya memang udah gada soal lagi
                    self.isFinished = true
                }
            } else {
               
                // uda level 3 + soal abis
                self.isFinished = true
            }
        } else {
            
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
