import SpriteKit
import SwiftUI

class CandyGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: CandyGameData?
    var textures: [SKSpriteNode] = []
    var secondTextures: [SKNode] = []
    var texturesStyle: [SKSpriteNode] = []
    var secondTexturesStyle: [SKSpriteNode] = []
    var arrayOfRecipe: Set<String> = []
    var isNodeBeingDragged = false
    var draggedNode: SKSpriteNode?
    var time: SKLabelNode!
    var timer: Timer?
    var excludedItems: Set<String> = []
    var moneyLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size = UIScreen.main.bounds.size
        setupView()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        moveNode(touchLocation: touchLocation)
        prepareTapped(touchLocation: touchLocation)
        doubleEarning(touchLocation: touchLocation)
        addTime(touchLocation: touchLocation)
        removeSpoiledItems(touchLocation: touchLocation)
        backTapped(touchLocation: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isNodeBeingDragged, let node = draggedNode else { return }
        let touchLocation = touch.location(in: self)
        node.position = touchLocation
        dragItemToPot()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isNodeBeingDragged = false
        draggedNode?.removeFromParent()
    }
}
