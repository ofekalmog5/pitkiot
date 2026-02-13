import SwiftUI

@main
struct HebrewAliasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GameViewModel())
        }
    }
}
