import SpriteKit
import SwiftUI

struct CandyGameModuleView: View {
    @StateObject var candyGameModuleModel =  CandyGameModuleViewModel()
    @StateObject var gameModel =  CandyGameData()
    @ObservedObject var router: Router
    
    var body: some View {
        SpriteView(scene: candyGameModuleModel.createCandyGameScene(gameData: gameModel))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $gameModel.isLose) {
                CandyLevelView(router: router)
            }
        
            .navigationDestination(isPresented: $gameModel.isWin) {
                CandyLevelView(router: router)
            }
        
            .navigationDestination(isPresented: $gameModel.isLevels) {
                CandyMenuView(router: router)
            }
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyGameModuleView(router: router)
}

