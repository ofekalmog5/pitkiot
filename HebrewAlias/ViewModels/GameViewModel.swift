import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var gamePhase: GamePhase = .menu
    @Published var settings: GameSettings = GameSettings()
    @Published var teams: [Team] = []
    @Published var currentRound: Int = 1
    @Published var currentTeamIndex: Int = 0
    @Published var currentWords: [Word] = []
    @Published var timeRemaining: Int = 60
    @Published var isTimerRunning: Bool = false
    @Published var guessedThisRound: Int = 0
    @Published var skippedThisRound: Int = 0
    @Published var gameResults: GameStatistics?
    
    private var timer: Timer?
    private var wordDatabase = WordDatabase.shared
    private var roundResults: [RoundResult] = []
    
    // MARK: - Game Setup
    func createTeams(with teamNames: [String]) {
        teams = teamNames.enumerated().map { index, name in
            var team = Team(name: name, color: Team.TeamColor.allCases[index % Team.TeamColor.allCases.count])
            team.score = 0
            return team
        }
    }
    
    func startGame() {
        gamePhase = .gamePlay
        currentRound = 1
        currentTeamIndex = 0
        roundResults = []
        prepareRound()
    }
    
    // MARK: - Round Management
    private func prepareRound() {
        let wordCount = settings.unlimitedTimeMode ? settings.wordsPerTurnInUnlimitedMode : settings.wordsPerRound
        currentWords = wordDatabase.getRandomWords(count: wordCount, difficulty: settings.difficulty)
        guessedThisRound = 0
        skippedThisRound = 0
        timeRemaining = settings.timePerTurn
    }
    
    func startTurn() {
        if !settings.unlimitedTimeMode {
            isTimerRunning = true
            timeRemaining = settings.timePerTurn
            startTimer()
        } else {
            isTimerRunning = false
            timeRemaining = 0
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    private func tick() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            endTurn()
        }
    }
    
    func markWordAsGuessed(_ word: Word) {
        if let index = currentWords.firstIndex(where: { $0.id == word.id }) {
            currentWords[index].isGuessed = true
            guessedThisRound += 1
            teams[currentTeamIndex].score += 1
        }
    }
    
    func markWordAsSkipped(_ word: Word) {
        if let index = currentWords.firstIndex(where: { $0.id == word.id }) {
            currentWords[index].isSkipped = true
            skippedThisRound += 1
        }
    }
    
    func endTurn() {
        isTimerRunning = false
        timer?.invalidate()
        
        let turnResult = TurnResult(
            teamName: teams[currentTeamIndex].name,
            guessedCount: guessedThisRound,
            skippedCount: skippedThisRound,
            totalTime: settings.timePerTurn
        )
        
        // Move to next team
        currentTeamIndex += 1
        
        if currentTeamIndex < settings.numberOfTeams {
            // Prepare new words for the next team
            prepareRound()
            gamePhase = .roundResults
        } else {
            // Round complete
            endRound(turnResults: [turnResult])
        }
    }
    
    private func endRound(turnResults: [TurnResult]) {
        let roundResult = RoundResult(roundNumber: currentRound, turnResults: turnResults)
        roundResults.append(roundResult)
        
        if currentRound < settings.numberOfRounds {
            currentRound += 1
            currentTeamIndex = 0
            prepareRound()
            gamePhase = .gamePlay
        } else {
            endGame()
        }
    }
    
    private func endGame() {
        let totalGuessed = teams.reduce(0) { $0 + $1.score }
        let winningTeam = teams.max { $0.score < $1.score } ?? teams[0]
        
        let stats = GameStatistics(
            totalGuessedWords: totalGuessed,
            totalSkippedWords: 0,
            averageTimePerWord: settings.timePerTurn > 0 ? Double(totalGuessed) / Double(settings.timePerTurn) : 0,
            winningTeam: winningTeam,
            finalScores: Dictionary(uniqueKeysWithValues: teams.map { ($0.name, $0.score) })
        )
        
        gameResults = stats
        gamePhase = .gameResults
    }
    
    func getCurrentTeam() -> Team {
        return teams[min(currentTeamIndex, teams.count - 1)]
    }
    
    func getNextWord() -> Word? {
        // If all current words are done, generate a new one
        if !currentWords.contains(where: { !$0.isGuessed && !$0.isSkipped }) {
            // Generate a new word during the turn
            if let newWord = wordDatabase.getRandomWords(count: 1, difficulty: settings.difficulty).first {
                currentWords.append(newWord)
            }
        }
        return currentWords.first { !$0.isGuessed && !$0.isSkipped }
    }
    
    func restartTurn() {
        // Reset the current turn for the same team
        isTimerRunning = false
        timer?.invalidate()
        guessedThisRound = 0
        skippedThisRound = 0
        timeRemaining = settings.timePerTurn
        
        // Reload words for this turn
        let wordCount = settings.unlimitedTimeMode ? settings.wordsPerTurnInUnlimitedMode : settings.wordsPerRound
        currentWords = wordDatabase.getRandomWords(count: wordCount, difficulty: settings.difficulty)
    }
    
    func restart() {
        gamePhase = .menu
        teams = []
        currentRound = 1
        currentTeamIndex = 0
        currentWords = []
        timeRemaining = 60
        isTimerRunning = false
        guessedThisRound = 0
        skippedThisRound = 0
        gameResults = nil
        roundResults = []
    }
}
