import Foundation

class WordDatabase {
    static let shared = WordDatabase()
    
    private(set) var allWords: [Word] = []
    
    init() {
        loadWords()
    }

    private func loadWords() {
        if let url = Bundle.main.url(forResource: "words_he", withExtension: "txt"),
           let contents = try? String(contentsOf: url, encoding: .utf8) {
            let parsed = contents
                .split(whereSeparator: \.isNewline)
                .compactMap(parseLine)
            if !parsed.isEmpty {
                allWords = parsed
                return
            }
        }

        allWords = fallbackWords()
    }

    private func parseLine(_ line: Substring) -> Word? {
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty || trimmed.hasPrefix("#") {
            return nil
        }

        let parts = trimmed.split(separator: "|", omittingEmptySubsequences: false)
        guard parts.count == 3 else {
            return nil
        }

        let text = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
        let category = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
        let difficultyText = parts[2].trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        let difficulty: DifficultyLevel
        switch difficultyText {
        case "easy":
            difficulty = .easy
        case "medium":
            difficulty = .medium
        case "hard":
            difficulty = .hard
        default:
            return nil
        }

        guard !text.isEmpty, !category.isEmpty else {
            return nil
        }

        return Word(text: text, category: category, difficulty: difficulty)
    }

    private func fallbackWords() -> [Word] {
        return [
            Word(text: "כלב", category: "בעלי חיים", difficulty: .easy),
            Word(text: "חתול", category: "בעלי חיים", difficulty: .easy),
            Word(text: "אריה", category: "בעלי חיים", difficulty: .easy),
            Word(text: "פיל", category: "בעלי חיים", difficulty: .easy),
            Word(text: "דג", category: "בעלי חיים", difficulty: .easy),
            Word(text: "לחם", category: "אוכל", difficulty: .easy),
            Word(text: "חלב", category: "אוכל", difficulty: .easy),
            Word(text: "גבינה", category: "אוכל", difficulty: .easy),
            Word(text: "ביצה", category: "אוכל", difficulty: .easy),
            Word(text: "תפוח", category: "אוכל", difficulty: .easy),
            Word(text: "כדורגל", category: "ספורט", difficulty: .easy),
            Word(text: "כדורסל", category: "ספורט", difficulty: .easy),
            Word(text: "שחייה", category: "ספורט", difficulty: .easy),
            Word(text: "ריצה", category: "ספורט", difficulty: .easy),
            Word(text: "טניס", category: "ספורט", difficulty: .easy),
            Word(text: "הר", category: "טבע", difficulty: .easy),
            Word(text: "יער", category: "טבע", difficulty: .easy),
            Word(text: "נהר", category: "טבע", difficulty: .easy),
            Word(text: "שמש", category: "טבע", difficulty: .easy),
            Word(text: "ירח", category: "טבע", difficulty: .easy),
            Word(text: "שמחה", category: "רגשות", difficulty: .easy),
            Word(text: "עצב", category: "רגשות", difficulty: .easy),
            Word(text: "כעס", category: "רגשות", difficulty: .easy),
            Word(text: "פחד", category: "רגשות", difficulty: .easy),
            Word(text: "אהבה", category: "רגשות", difficulty: .easy)
        ]
    }
    
    func getRandomWords(count: Int, difficulty: DifficultyLevel = .medium) -> [Word] {
        if difficulty == .mixed {
            // Mix words from all difficulties
            return Array(allWords.shuffled().prefix(count))
        } else {
            let filtered = allWords.filter { $0.difficulty == difficulty }
            return Array(filtered.shuffled().prefix(count))
        }
    }
    
    func getUnusedRandomWord(difficulty: DifficultyLevel, excludeIds: Set<UUID>) -> Word? {
        var candidates: [Word]
        
        if difficulty == .mixed {
            candidates = allWords.filter { !excludeIds.contains($0.id) }
        } else {
            candidates = allWords.filter { $0.difficulty == difficulty && !excludeIds.contains($0.id) }
        }
        
        return candidates.shuffled().first
    }
    
    func getWordsByCategory(_ category: String, count: Int, difficulty: DifficultyLevel = .medium) -> [Word] {
        let categoryWords = allWords.filter { $0.category == category && $0.difficulty == difficulty }
        return Array(categoryWords.shuffled().prefix(count))
    }
    
    func addCustomWord(_ text: String, category: String, difficulty: DifficultyLevel = .medium) {
        let newWord = Word(text: text, category: category, difficulty: difficulty)
        allWords.append(newWord)
    }
}
