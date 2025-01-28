import SwiftUI

class CandyGameModuleViewModel: ObservableObject {
    let contact = CandyGameModuleModel()

    func createCandyGameScene(gameData: CandyGameData) -> CandyGameSpriteKit {
        let scene = CandyGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
