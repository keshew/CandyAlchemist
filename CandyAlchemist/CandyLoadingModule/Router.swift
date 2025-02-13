import SwiftUI

enum AppScreen: Hashable {
   case menu
    case level
    case achievements
    case detailAchievements(AchievementsModel)
    case settings
    case rules
    case shop
    case trainingLoading
    case training
    case gameLoading
    case game
    case recept
}

final class Router: ObservableObject {
    @Published var path: [AppScreen] = []
    
    func showMenu() {
        path.append(.menu)
    }
    
    func showShop() {
        path.append(.shop)
    }
    
    func showLevel() {
        path.append(.level)
    }
    
    func showAchievements() {
        path.append(.achievements)
    }
    
    func showDetailAchievements(achivModel: AchievementsModel) {
        path.append(.detailAchievements(achivModel))
    }
    
    func showSettings() {
        path.append(.settings)
    }
    
    func showRules() {
        path.append(.rules)
    }
    
    func showTrainingLoading() {
        path.append(.trainingLoading)
    }
    
    func showTraining() {
        path.append(.training)
    }
    
    func showGameLoading() {
        path.append(.gameLoading)
    }
    
    func showGame() {
        path.append(.game)
    }
    
    func showRecept() {
        path.append(.recept)
    }
    
    func back() {
        if !path.isEmpty {
            if path.last == CandyAlchemist.AppScreen.level || path.last == CandyAlchemist.AppScreen.rules || path.last == CandyAlchemist.AppScreen.settings {
                showMenu()
            } else {
                path.removeLast()
            }
        }
    }
}
