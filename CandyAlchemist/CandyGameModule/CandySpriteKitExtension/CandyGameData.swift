import SwiftUI

class CandyGameData: ObservableObject {
    @Published var isWin = false
    @Published var isLevels = false
    @Published var isLose = false
    @Published var timeLeft = 180
    @Published var isAnimationRunning = false
    @Published var array: [String: Set<String>]  = [:]
    @Published var doubleMoney = 100
    @Published var cointAmount = UserDefaults.standard.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0
}
