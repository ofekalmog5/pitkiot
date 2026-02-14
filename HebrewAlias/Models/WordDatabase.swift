import Foundation

class WordDatabase {
    static let shared = WordDatabase()
    
    private(set) var allWords: [Word] = []
    
    init() {
        loadWords()
    }
    
    private func loadWords() {
        allWords = [
            // EASY - בעלי חיים (Animals)
            Word(text: "אריה", category: "בעלי חיים", difficulty: .easy),
            Word(text: "פיל", category: "בעלי חיים", difficulty: .easy),
            Word(text: "כלב", category: "בעלי חיים", difficulty: .easy),
            Word(text: "חתול", category: "בעלי חיים", difficulty: .easy),
            Word(text: "דג", category: "בעלי חיים", difficulty: .easy),
            Word(text: "עכברוש", category: "בעלי חיים", difficulty: .easy),
            Word(text: "ארנב", category: "בעלי חיים", difficulty: .easy),
            Word(text: "צב", category: "בעלי חיים", difficulty: .easy),
            Word(text: "בקר", category: "בעלי חיים", difficulty: .easy),
            Word(text: "חזיר", category: "בעלי חיים", difficulty: .easy),
            Word(text: "כבשה", category: "בעלי חיים", difficulty: .easy),
            Word(text: "סוס", category: "בעלי חיים", difficulty: .easy),
            Word(text: "דולפין", category: "בעלי חיים", difficulty: .medium),
            Word(text: "נשר", category: "בעלי חיים", difficulty: .medium),
            Word(text: "זברה", category: "בעלי חיים", difficulty: .medium),
            Word(text: "דוב", category: "בעלי חיים", difficulty: .medium),
            Word(text: "זאב", category: "בעלי חיים", difficulty: .medium),
            Word(text: "קוף", category: "בעלי חיים", difficulty: .medium),
            Word(text: "לביאה", category: "בעלי חיים", difficulty: .medium),
            Word(text: "נמר", category: "בעלי חיים", difficulty: .medium),
            Word(text: "פינגווין", category: "בעלי חיים", difficulty: .medium),
            Word(text: "זירפה", category: "בעלי חיים", difficulty: .medium),
            Word(text: "עקרב", category: "בעלי חיים", difficulty: .medium),
            Word(text: "צפרדע", category: "בעלי חיים", difficulty: .medium),
            Word(text: "חמנדס", category: "בעלי חיים", difficulty: .hard),
            Word(text: "הליכסון", category: "בעלי חיים", difficulty: .hard),
            Word(text: "תנין", category: "בעלי חיים", difficulty: .hard),
            Word(text: "כנימה", category: "בעלי חיים", difficulty: .hard),
            Word(text: "יקנופה", category: "בעלי חיים", difficulty: .hard),
            Word(text: "חרטום", category: "בעלי חיים", difficulty: .hard),
            Word(text: "אקטופוס", category: "בעלי חיים", difficulty: .hard),
            Word(text: "שקנאי", category: "בעלי חיים", difficulty: .hard),
            Word(text: "בובקט", category: "בעלי חיים", difficulty: .hard),
            Word(text: "כוהל", category: "בעלי חיים", difficulty: .hard),
            
            // EASY - אוכל (Food)
            Word(text: "פיצה", category: "אוכל", difficulty: .easy),
            Word(text: "לחם", category: "אוכל", difficulty: .easy),
            Word(text: "חלב", category: "אוכל", difficulty: .easy),
            Word(text: "חמאה", category: "אוכל", difficulty: .easy),
            Word(text: "גבינה", category: "אוכל", difficulty: .easy),
            Word(text: "ביצה", category: "אוכל", difficulty: .easy),
            Word(text: "בצל", category: "אוכל", difficulty: .easy),
            Word(text: "בננה", category: "אוכל", difficulty: .easy),
            Word(text: "תפוח", category: "אוכל", difficulty: .easy),
            Word(text: "מים", category: "אוכל", difficulty: .easy),
            Word(text: "סוכר", category: "אוכל", difficulty: .easy),
            Word(text: "מלח", category: "אוכל", difficulty: .easy),
            Word(text: "בשר", category: "אוכל", difficulty: .easy),
            Word(text: "קמח", category: "אוכל", difficulty: .easy),
            Word(text: "המבורגר", category: "אוכל", difficulty: .medium),
            Word(text: "תפוח עץ", category: "אוכל", difficulty: .medium),
            Word(text: "שוקולד", category: "אוכל", difficulty: .medium),
            Word(text: "ספגטי", category: "אוכל", difficulty: .medium),
            Word(text: "אורז", category: "אוכל", difficulty: .medium),
            Word(text: "עוגה", category: "אוכל", difficulty: .medium),
            Word(text: "עוגיה", category: "אוכל", difficulty: .medium),
            Word(text: "פסטה", category: "אוכל", difficulty: .medium),
            Word(text: "פלפל", category: "אוכל", difficulty: .medium),
            Word(text: "חצילים", category: "אוכל", difficulty: .medium),
            Word(text: "עדשים", category: "אוכל", difficulty: .medium),
            Word(text: "קפה", category: "אוכל", difficulty: .medium),
            Word(text: "תה", category: "אוכל", difficulty: .medium),
            Word(text: "מיץ", category: "אוכל", difficulty: .medium),
            Word(text: "קביאר", category: "אוכל", difficulty: .hard),
            Word(text: "שומשום", category: "אוכל", difficulty: .hard),
            Word(text: "פטריות", category: "אוכל", difficulty: .hard),
            Word(text: "אנטיפסטו", category: "אוכל", difficulty: .hard),
            Word(text: "קוואר", category: "אוכל", difficulty: .hard),
            Word(text: "סושי", category: "אוכל", difficulty: .hard),
            Word(text: "זעפרן", category: "אוכל", difficulty: .hard),
            Word(text: "פואה גרא", category: "אוכל", difficulty: .hard),
            Word(text: "גרנוש", category: "אוכל", difficulty: .hard),
            Word(text: "אמרתו", category: "אוכל", difficulty: .hard),
            
            // EASY - ספורט (Sports)
            Word(text: "כדורגל", category: "ספורט", difficulty: .easy),
            Word(text: "כדורסל", category: "ספורט", difficulty: .easy),
            Word(text: "טניס", category: "ספורט", difficulty: .easy),
            Word(text: "שחייה", category: "ספורט", difficulty: .easy),
            Word(text: "אופניים", category: "ספורט", difficulty: .easy),
            Word(text: "ג'ודו", category: "ספורט", difficulty: .easy),
            Word(text: "ריצה", category: "ספורט", difficulty: .easy),
            Word(text: "קפיצה", category: "ספורט", difficulty: .easy),
            Word(text: "זריקה", category: "ספורט", difficulty: .easy),
            Word(text: "הפיכה", category: "ספורט", difficulty: .easy),
            Word(text: "קפיצות", category: "ספורט", difficulty: .easy),
            Word(text: "טיפול", category: "ספורט", difficulty: .easy),
            Word(text: "סקי", category: "ספורט", difficulty: .easy),
            Word(text: "שיא", category: "ספורט", difficulty: .easy),
            Word(text: "אתלטיקה", category: "ספורט", difficulty: .medium),
            Word(text: "הוקי", category: "ספורט", difficulty: .medium),
            Word(text: "כדוריד", category: "ספורט", difficulty: .medium),
            Word(text: "ריצה", category: "ספורט", difficulty: .medium),
            Word(text: "סקי", category: "ספורט", difficulty: .medium),
            Word(text: "כדור יד", category: "ספורט", difficulty: .medium),
            Word(text: "טבלה", category: "ספורט", difficulty: .medium),
            Word(text: "גלישה", category: "ספורט", difficulty: .medium),
            Word(text: "סקטבורד", category: "ספורט", difficulty: .medium),
            Word(text: "תחרות", category: "ספורט", difficulty: .medium),
            Word(text: "מישמר", category: "ספורט", difficulty: .medium),
            Word(text: "קרקע", category: "ספורט", difficulty: .medium),
            Word(text: "משחק", category: "ספורט", difficulty: .medium),
            Word(text: "פעמיים", category: "ספורט", difficulty: .medium),
            Word(text: "סיגנטיס", category: "ספורט", difficulty: .hard),
            Word(text: "שייט מפרשים", category: "ספורט", difficulty: .hard),
            Word(text: "אסקווש", category: "ספורט", difficulty: .hard),
            Word(text: "קריקט", category: "ספורט", difficulty: .hard),
            Word(text: "במינטון", category: "ספורט", difficulty: .hard),
            Word(text: "סקויש", category: "ספורט", difficulty: .hard),
            Word(text: "שנורקלינג", category: "ספורט", difficulty: .hard),
            Word(text: "אקווה סקי", category: "ספורט", difficulty: .hard),
            Word(text: "טראמפולינה", category: "ספורט", difficulty: .hard),
            Word(text: "ספורט שלדה", category: "ספורט", difficulty: .hard),
            
            // EASY - סרטים (Movies)
            Word(text: "שרק", category: "סרטים", difficulty: .easy),
            Word(text: "פרוזן", category: "סרטים", difficulty: .easy),
            Word(text: "טוי סטורי", category: "סרטים", difficulty: .easy),
            Word(text: "אווטאר", category: "סרטים", difficulty: .easy),
            Word(text: "טיטאניק", category: "סרטים", difficulty: .easy),
            
            // MEDIUM - סרטים
            Word(text: "מלך הטבעות", category: "סרטים", difficulty: .medium),
            Word(text: "הארי פוטר", category: "סרטים", difficulty: .medium),
            Word(text: "פרק הכוכבים", category: "סרטים", difficulty: .medium),
            Word(text: "אינספקטור", category: "סרטים", difficulty: .medium),
            Word(text: "המשחק", category: "סרטים", difficulty: .medium),
            
            // HARD - סרטים
            Word(text: "די ווינצ'י קוד", category: "סרטים", difficulty: .hard),
            Word(text: "הנוקדאון", category: "סרטים", difficulty: .hard),
            Word(text: "אינטרסטלאר", category: "סרטים", difficulty: .hard),
            Word(text: "שיניונים", category: "סרטים", difficulty: .hard),
            Word(text: "בזל", category: "סרטים", difficulty: .hard),
            
            // EASY - טכנולוגיה (Technology)
            Word(text: "טלפון", category: "טכנולוגיה", difficulty: .easy),
            Word(text: "מחשב", category: "טכנולוגיה", difficulty: .easy),
            Word(text: "טלויזיה", category: "טכנולוגיה", difficulty: .easy),
            Word(text: "מצלמה", category: "טכנולוגיה", difficulty: .easy),
            Word(text: "שעון", category: "טכנולוגיה", difficulty: .easy),
            
            // MEDIUM - טכנולוגיה
            Word(text: "אינטרנט", category: "טכנולוגיה", difficulty: .medium),
            Word(text: "רובוט", category: "טכנולוגיה", difficulty: .medium),
            Word(text: "מטוס", category: "טכנולוגיה", difficulty: .medium),
            Word(text: "דרונה", category: "טכנולוגיה", difficulty: .medium),
            Word(text: "לוויין", category: "טכנולוגיה", difficulty: .medium),
            
            // HARD - טכנולוגיה
            Word(text: "משקפי מציאות", category: "טכנולוגיה", difficulty: .hard),
            Word(text: "בלוקצ'יין", category: "טכנולוגיה", difficulty: .hard),
            Word(text: "קוונטום", category: "טכנולוגיה", difficulty: .hard),
            Word(text: "ביומטריה", category: "טכנולוגיה", difficulty: .hard),
            Word(text: "הולוגרפיה", category: "טכנולוגיה", difficulty: .hard),
            
            // EASY - טבע (Nature)
            Word(text: "הר", category: "טבע", difficulty: .easy),
            Word(text: "יער", category: "טבע", difficulty: .easy),
            Word(text: "נהר", category: "טבע", difficulty: .easy),
            Word(text: "שמש", category: "טבע", difficulty: .easy),
            Word(text: "ירח", category: "טבע", difficulty: .easy),
            
            // MEDIUM - טבע
            Word(text: "אוקיינוס", category: "טבע", difficulty: .medium),
            Word(text: "שדה", category: "טבע", difficulty: .medium),
            Word(text: "עץ", category: "טבע", difficulty: .medium),
            Word(text: "פרח", category: "טבע", difficulty: .medium),
            Word(text: "שלג", category: "טבע", difficulty: .medium),
            
            // HARD - טבע
            Word(text: "גשם", category: "טבע", difficulty: .hard),
            Word(text: "הוריקן", category: "טבע", difficulty: .hard),
            Word(text: "סיסמית", category: "טבע", difficulty: .hard),
            Word(text: "געש", category: "טבע", difficulty: .hard),
            Word(text: "ממתקים קטנים", category: "טבע", difficulty: .hard),
            
            // EASY - מקצועות (Professions)
            Word(text: "רופא", category: "מקצועות", difficulty: .easy),
            Word(text: "מורה", category: "מקצועות", difficulty: .easy),
            Word(text: "שוטר", category: "מקצועות", difficulty: .easy),
            Word(text: "קוק", category: "מקצועות", difficulty: .easy),
            Word(text: "נהג", category: "מקצועות", difficulty: .easy),
            
            // MEDIUM - מקצועות
            Word(text: "מהנדס", category: "מקצועות", difficulty: .medium),
            Word(text: "אדריכל", category: "מקצועות", difficulty: .medium),
            Word(text: "עורך דין", category: "מקצועות", difficulty: .medium),
            Word(text: "שופט", category: "מקצועות", difficulty: .medium),
            Word(text: "תרגם", category: "מקצועות", difficulty: .medium),
            
            // HARD - מקצועות
            Word(text: "פילוסוף", category: "מקצועות", difficulty: .hard),
            Word(text: "ביולוג", category: "מקצועות", difficulty: .hard),
            Word(text: "אוקיאנוגרף", category: "מקצועות", difficulty: .hard),
            Word(text: "ארכיאולוג", category: "מקצועות", difficulty: .hard),
            Word(text: "מטאורולוג", category: "מקצועות", difficulty: .hard),
            
            // EASY - מדינות (Countries)
            Word(text: "ישראל", category: "מדינות", difficulty: .easy),
            Word(text: "אמריקה", category: "מדינות", difficulty: .easy),
            Word(text: "בריטניה", category: "מדינות", difficulty: .easy),
            Word(text: "צרפת", category: "מדינות", difficulty: .easy),
            Word(text: "יפן", category: "מדינות", difficulty: .easy),
            
            // MEDIUM - מדינות
            Word(text: "גרמניה", category: "מדינות", difficulty: .medium),
            Word(text: "סין", category: "מדינות", difficulty: .medium),
            Word(text: "קנדה", category: "מדינות", difficulty: .medium),
            Word(text: "אוסטרליה", category: "מדינות", difficulty: .medium),
            Word(text: "ברזיל", category: "מדינות", difficulty: .medium),
            
            // HARD - מדינות
            Word(text: "בנגלדש", category: "מדינות", difficulty: .hard),
            Word(text: "לוקסמבורג", category: "מדינות", difficulty: .hard),
            Word(text: "קירגיזסטן", category: "מדינות", difficulty: .hard),
            Word(text: "ליכטנשטיין", category: "מדינות", difficulty: .hard),
            Word(text: "מוזמביק", category: "מדינות", difficulty: .hard)
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
