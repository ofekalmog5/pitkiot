import Foundation

// MARK: - Difficulty Level
enum DifficultyLevel: String, CaseIterable {
    case easy = "קל"
    case medium = "בינוני"
    case hard = "קשה"
    
    var description: String {
        switch self {
        case .easy:
            return "מילים פשוטות וידועות"
        case .medium:
            return "מילים בינוניות"
        case .hard:
            return "מילים מורכבות וקשות"
        }
    }
}

// MARK: - Game Settings
struct GameSettings {
    var numberOfRounds: Int = 3
    var timePerTurn: Int = 60  // seconds
    var numberOfTeams: Int = 2
    var wordsPerRound: Int = 10
    var difficulty: DifficultyLevel = .medium
    
    static let presets = [
        GameSettings(numberOfRounds: 1, timePerTurn: 60, numberOfTeams: 2, wordsPerRound: 5, difficulty: .easy),
        GameSettings(numberOfRounds: 3, timePerTurn: 60, numberOfTeams: 2, wordsPerRound: 10, difficulty: .medium),
        GameSettings(numberOfRounds: 3, timePerTurn: 90, numberOfTeams: 3, wordsPerRound: 10, difficulty: .medium),
        GameSettings(numberOfRounds: 5, timePerTurn: 60, numberOfTeams: 4, wordsPerRound: 15, difficulty: .hard)
    ]
}

// MARK: - Team
struct Team: Identifiable {
    let id = UUID()
    var name: String
    var color: TeamColor
    var score: Int = 0
    var players: [String] = []
    
    enum TeamColor: String, CaseIterable {
        case red = "אדום"
        case blue = "כחול"
        case green = "ירוק"
        case yellow = "צהוב"
        
        var colorValue: String {
            switch self {
            case .red: return "red"
            case .blue: return "blue"
            case .green: return "green"
            case .yellow: return "yellow"
            }
        }
    }
}

// MARK: - Word
struct Word: Identifiable {
    let id = UUID()
    let text: String
    let category: String
    let difficulty: DifficultyLevel
    var isGuessed: Bool = false
    var isSkipped: Bool = false
    
    enum Category: String, CaseIterable {
        case animals = "בעלי חיים"
        case food = "אוכל"
        case sports = "ספורט"
        case movies = "סרטים"
        case technology = "טכנולוגיה"
        case nature = "טבע"
        case professions = "מקצועות"
        case countries = "מדינות"
    }
}

// MARK: - Turn
struct Turn {
    let id = UUID()
    let teamId: UUID
    let round: Int
    let words: [Word]
    var guessedCount: Int = 0
    var skippedCount: Int = 0
    var timeRemaining: Int
    var isActive: Bool = false
    
    mutating func markWordGuessed(_ word: Word) {
        if let index = words.firstIndex(where: { $0.id == word.id }) {
            var updatedWord = words[index]
            updatedWord.isGuessed = true
            guessedCount += 1
        }
    }
    
    mutating func markWordSkipped(_ word: Word) {
        if let index = words.firstIndex(where: { $0.id == word.id }) {
            var updatedWord = words[index]
            updatedWord.isSkipped = true
            skippedCount += 1
        }
    }
}

// MARK: - Game State
enum GamePhase {
    case menu
    case teamSetup
    case gamePlay
    case roundResults
    case gameResults
}

// MARK: - Round Result
struct RoundResult {
    let roundNumber: Int
    let turnResults: [TurnResult]
    
    var totalGuessed: Int {
        turnResults.reduce(0) { $0 + $1.guessedCount }
    }
}

struct TurnResult {
    let teamName: String
    let guessedCount: Int
    let skippedCount: Int
    let totalTime: Int
    var wordsPerMinute: Double {
        let timeInMinutes = Double(totalTime) / 60.0
        return timeInMinutes > 0 ? Double(guessedCount) / timeInMinutes : 0
    }
}

// MARK: - Game Statistics
struct GameStatistics {
    let totalGuessedWords: Int
    let totalSkippedWords: Int
    let averageTimePerWord: Double
    let winningTeam: Team
    let finalScores: [String: Int]
}
