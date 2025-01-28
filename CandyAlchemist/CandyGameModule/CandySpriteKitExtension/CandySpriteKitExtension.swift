import SwiftUI
import SpriteKit

extension CandyGameSpriteKit {
    
    func spawnTexture(at positionX: CGFloat) {
        var textureNames = [""]
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 2 {
            textureNames = [
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.partOfRecipe2.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe5.rawValue
            ]
        } else if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 7 {
            textureNames = [
                CandyImageName.part2OfRecept1.rawValue,
                CandyImageName.part2OfRecept2.rawValue,
                CandyImageName.part2OfRecept3.rawValue,
                CandyImageName.part2OfRecept4.rawValue,
                CandyImageName.part2OfRecept5.rawValue,
                CandyImageName.part2OfRecept6.rawValue,
                CandyImageName.part2OfRecept7.rawValue,
                CandyImageName.partOfRecipe5.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
            ]
        } else {
            textureNames = [
                CandyImageName.part2OfRecept1.rawValue,
                CandyImageName.part2OfRecept2.rawValue,
                CandyImageName.part2OfRecept3.rawValue,
                CandyImageName.part2OfRecept4.rawValue,
                CandyImageName.part2OfRecept5.rawValue,
                CandyImageName.part2OfRecept6.rawValue,
                CandyImageName.part2OfRecept7.rawValue,
                CandyImageName.partOfRecipe5.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
            ]
        }
        
        textureNames.removeAll(where: { excludedItems.contains($0) })
        
        let textureName = textureNames.randomElement()!
        
        let whiteStyleImageName: String
        switch textureName {
        case CandyImageName.greenItem.rawValue:
            whiteStyleImageName = CandyImageName.greenStyle.rawValue
        case CandyImageName.orangeItem.rawValue:
            whiteStyleImageName = CandyImageName.greenStyle.rawValue
        case CandyImageName.redItem.rawValue:
            whiteStyleImageName = CandyImageName.redStyle.rawValue
        default:
            whiteStyleImageName = CandyImageName.whiteStyle.rawValue
        }
        
        let whiteStyle  = SKSpriteNode(imageNamed: whiteStyleImageName)
        whiteStyle.size = CGSize(width: 80, height: 80)
        
        let texture = SKSpriteNode(imageNamed: textureName)
        texture.name = "texture"
        texture.userData = ["imageName": textureName]
        let specificSizes: [String: CGSize] = [
            CandyImageName.partOfRecipe3.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept5.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept2.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept4.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.greenItem.rawValue: CGSize(width: 45, height: 50),
            CandyImageName.orangeItem.rawValue: CGSize(width: 45, height: 50)
        ]
        
        if let specificSize = specificSizes[textureName] {
            texture.size = specificSize
        } else {
            texture.size = CGSize(width: 70, height: 70)
        }
        
        
        texture.position = CGPoint(x: positionX, y: size.height / 1.33)
        whiteStyle.position = CGPoint(x: positionX, y: size.height / 1.33)
        addChild(whiteStyle)
        addChild(texture)
        textures.append(texture)
        texturesStyle.append(whiteStyle)
    }
    
    func spawnSecondTexture(at positionX: CGFloat) {
        var textureNames = [""]
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 2 {
            textureNames = [
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.partOfRecipe2.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe5.rawValue
            ]
        } else if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 7 {
            textureNames = [
                CandyImageName.part2OfRecept1.rawValue,
                CandyImageName.part2OfRecept2.rawValue,
                CandyImageName.part2OfRecept3.rawValue,
                CandyImageName.part2OfRecept4.rawValue,
                CandyImageName.part2OfRecept5.rawValue,
                CandyImageName.part2OfRecept6.rawValue,
                CandyImageName.part2OfRecept7.rawValue,
                CandyImageName.partOfRecipe5.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
            ]
        } else {
            textureNames = [
                CandyImageName.part2OfRecept1.rawValue,
                CandyImageName.part2OfRecept2.rawValue,
                CandyImageName.part2OfRecept3.rawValue,
                CandyImageName.part2OfRecept4.rawValue,
                CandyImageName.part2OfRecept5.rawValue,
                CandyImageName.part2OfRecept6.rawValue,
                CandyImageName.part2OfRecept7.rawValue,
                CandyImageName.partOfRecipe5.rawValue,
                CandyImageName.partOfRecipe4.rawValue,
                CandyImageName.partOfRecipe3.rawValue,
                CandyImageName.partOfRecipe1.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
                CandyImageName.greenItem.rawValue,
                CandyImageName.orangeItem.rawValue,
                CandyImageName.redItem.rawValue,
            ]
        }
        
        textureNames.removeAll(where: { excludedItems.contains($0) })
        
        let textureName = textureNames.randomElement()!
        let whiteStyleImageName: String
            switch textureName {
            case CandyImageName.greenItem.rawValue:
                whiteStyleImageName = CandyImageName.greenStyle.rawValue
            case CandyImageName.orangeItem.rawValue:
                whiteStyleImageName = CandyImageName.greenStyle.rawValue
            case CandyImageName.redItem.rawValue:
                whiteStyleImageName = CandyImageName.redStyle.rawValue
            default:
                whiteStyleImageName = CandyImageName.whiteStyle.rawValue
            }
        
        let whiteStyle  = SKSpriteNode(imageNamed: whiteStyleImageName)
        whiteStyle.size = CGSize(width: 80, height: 80)
        
        let texture = SKSpriteNode(imageNamed: textureName)
        texture.name = "texture"
        texture.userData = ["imageName": textureName]
        let specificSizes: [String: CGSize] = [
            CandyImageName.partOfRecipe3.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept5.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept2.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.part2OfRecept4.rawValue: CGSize(width: 50, height: 50),
            CandyImageName.greenItem.rawValue: CGSize(width: 45, height: 50),
            CandyImageName.orangeItem.rawValue: CGSize(width: 45, height: 50)
        ]
        
        if let specificSize = specificSizes[textureName] {
            texture.size = specificSize
        } else {
            texture.size = CGSize(width: 70, height: 70)
        }
        
        texture.position = CGPoint(x: positionX, y: size.height / 1.64)
        whiteStyle.position = CGPoint(x: positionX, y: size.height / 1.64)
        addChild(whiteStyle)
        addChild(texture)
        secondTextures.append(texture)
        secondTexturesStyle.append(whiteStyle)
    }
    
    func updateTextures() {
        let textureWidth: CGFloat = 80
        let speedTexture: CGFloat = 0.5
        
        for (index, texture) in textures.enumerated() {
            texture.position.x += speedTexture
            if texture.position.x > size.width + (textureWidth / 2) {
                textures.remove(at: index)
                texture.removeFromParent()
            }
        }
        
        for (index, texture) in texturesStyle.enumerated() {
            texture.position.x += speedTexture
            if texture.position.x > size.width + (textureWidth / 2) {
                texturesStyle.remove(at: index)
                texture.removeFromParent()
                spawnTexture(at: -textureWidth / 2)
            }
        }
        
        for (index, texture) in secondTextures.enumerated() {
            texture.position.x -= speedTexture
            
            if texture.position.x < -textureWidth / 2 {
                secondTextures.remove(at: index)
                texture.removeFromParent()
            }
        }
        
        for (index, texture) in secondTexturesStyle.enumerated() {
            texture.position.x -= speedTexture
            
            if texture.position.x < -textureWidth / 2 {
                secondTexturesStyle.remove(at: index)
                texture.removeFromParent()
                spawnSecondTexture(at: size.width + textureWidth / 2)
            }
        }
    }
    
    func createPartOfRecipe() {
        for i in 0..<6 {
            spawnTexture(at: CGFloat(i) * 80)
        }
        
        for i in 0..<6 {
            spawnSecondTexture(at: CGFloat(i) * 80)
        }
        
        run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run(updateTextures),
            SKAction.wait(forDuration: 0.01)
        ])))
    }
    
    func compareSetWithNestedSets(set: Set<String>, nestedSets: [Set<String>]) -> Bool {
        for nestedSet in nestedSets {
            if set == nestedSet {
                return true
            }
        }
        return false
    }
    
    func checkElementsInNestedSets(elements: Set<String>, nestedSets: [Set<String>]) -> Bool {
        for nestedSet in nestedSets {
            if elements.isSubset(of: nestedSet) {
                return true
            }
        }
        return false
    }
    
    func createAnimationRightElement() {
        let rightElementAnimation = SKSpriteNode(imageNamed: CandyImageName.rightElementAnimation.rawValue)
        rightElementAnimation.size = CGSize(width: size.width / 1.15, height: 300)
        rightElementAnimation.zPosition = 1
        rightElementAnimation.xScale = 0.5
        rightElementAnimation.position = CGPoint(x: size.width / 2, y: size.height / 7)
        addChild(rightElementAnimation)
        
        let scaleAction = SKAction.scaleX(to: 1.0, duration: 2.0)
        let moveToPosition = SKAction.moveTo(y: size.height / 2.8, duration: 2.0)
        let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
        let appearAction = SKAction.group([scaleAction, moveToPosition, fadeInAction])
        
        rightElementAnimation.run(appearAction) {
            let waitAction = SKAction.wait(forDuration: 1.0)
            let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
            rightElementAnimation.run(waitAction) {
                rightElementAnimation.run(fadeOutAction) {
                    rightElementAnimation.removeFromParent()
                }
            }
        }
    }
    
    func moveNode(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "texture", arrayOfRecipe.count < 3 {
            isNodeBeingDragged = true
            draggedNode = tappedNode
            draggedNode?.position = touchLocation
            draggedNode?.zPosition = 3
        }
    }
    
    func hideBonus() {
        let namesToHide = ["thirdBonusLabel", "thirdBonusCoin", "thirdBonus", "secondBonusLabel", "secondBonusCoin", "secondBonus", "firstBonusLabel", "firstBonusCoin", "firstBonus", "moneyLabel", "coin", "moneyBackground"]
        for name in namesToHide {
            self.enumerateChildNodes(withName: name) { (node, stop) in
                node.isHidden = true
            }
        }
    }
    
    func hidePrepare() {
        let namesToHide = ["prepareBackButton", "prepareLabel"]
        for name in namesToHide {
            self.enumerateChildNodes(withName: name) { (node, stop) in
                node.isHidden = true
            }
        }
    }
    
    func showPrepareButton() {
        let prepareBackButton = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.rectangleButtonBackground.rawValue))
        prepareBackButton.name = "prepareBackButton"
        prepareBackButton.zPosition = 5
        prepareBackButton.size = CGSize(width: size.width * 0.45, height: size.height * 0.11)
        prepareBackButton.position = CGPoint(x: size.width / 2, y: size.height / 8)
        addChild(prepareBackButton)
        
        let prepareLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        prepareLabel.name = "prepareLabel"
        prepareLabel.text = "PREPARE"
        prepareLabel.color = .white
        prepareLabel.zPosition = 7
            
        prepareLabel.position = CGPoint(x: size.width / 2, y: size.height / 9)
        addChild(prepareLabel)
    }
    
    func showBonus() {
        let moneyBackground = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.moneyBackground.rawValue))
        moneyBackground.zPosition = 5
        moneyBackground.name = "moneyBackground"
        moneyBackground.size = CGSize(width: size.width * 0.25, height: size.height * 0.1)
        moneyBackground.position = CGPoint(x: size.width / 2, y: size.height / 6)
        addChild(moneyBackground)
        
        let coin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        coin.size = CGSize(width: size.width * 0.2, height: size.height * 0.08)
        coin.name = "coin"
        coin.position = CGPoint(x: size.width / 1.62, y: size.height / 6)
        coin.zPosition = 5
        addChild(coin)
        
        moneyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        moneyLabel.name = "moneyLabel"
        moneyLabel.zPosition = 5
        moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaults.standard.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        moneyLabel.position = CGPoint(x: size.width / 2.11, y: size.height / 6.65)
        addChild(moneyLabel)
        
        let firstBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus1.rawValue))
        firstBonus.name = "firstBonus"
        firstBonus.zPosition = 5
        firstBonus.size = CGSize(width: 88, height: 88)
        firstBonus.position = CGPoint(x: size.width / 4, y: size.height / 12.5)
        addChild(firstBonus)
        
        let firstBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        firstBonusCoin.name = "firstBonusCoin"
        firstBonusCoin.zPosition = 5
        firstBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        firstBonusCoin.position = CGPoint(x: size.width / 3.2, y: size.height / 20)
        addChild(firstBonusCoin)
        
        let firstBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        firstBonusLabel.zPosition = 5
        firstBonusLabel.name = "firstBonusLabel"
        firstBonusLabel.attributedText = NSAttributedString(string: "100", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        firstBonusLabel.position = CGPoint(x: size.width / 3.4, y: size.height / 28.5)
        addChild(firstBonusLabel)
        
        let secondBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus2.rawValue))
        secondBonus.name = "secondBonus"
        secondBonus.zPosition = 5
        secondBonus.size = CGSize(width: 88, height: 88)
        secondBonus.position = CGPoint(x: size.width / 2, y: size.height / 12.5)
        addChild(secondBonus)
        
        let secondBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        secondBonusCoin.name = "secondBonusCoin"
        secondBonusCoin.zPosition = 5
        secondBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        secondBonusCoin.position = CGPoint(x: size.width / 1.75, y: size.height / 20)
        addChild(secondBonusCoin)
        
        let secondBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        secondBonusLabel.name = "secondBonusLabel"
        secondBonusLabel.zPosition = 5
        secondBonusLabel.attributedText = NSAttributedString(string: "150", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        secondBonusLabel.position = CGPoint(x: size.width / 1.8, y: size.height / 28.5)
        addChild(secondBonusLabel)
        
        let thirdBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus3.rawValue))
        thirdBonus.name = "thirdBonus"
        thirdBonus.zPosition = 5
        thirdBonus.size = CGSize(width: 80, height: 80)
        thirdBonus.position = CGPoint(x: size.width / 1.35, y: size.height / 12.5)
        addChild(thirdBonus)
        
        let thirdBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        thirdBonusCoin.name = "thirdBonusCoin"
        thirdBonusCoin.zPosition = 5
        thirdBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        thirdBonusCoin.position = CGPoint(x: size.width / 1.23, y: size.height / 20)
        addChild(thirdBonusCoin)
        
        let thirdBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        thirdBonusLabel.name = "thirdBonusLabel"
        thirdBonusLabel.zPosition = 5
        thirdBonusLabel.attributedText = NSAttributedString(string: "250", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        thirdBonusLabel.position = CGPoint(x: size.width / 1.265, y: size.height / 28.5)
        addChild(thirdBonusLabel)
    }
    
    func dragItemToPot() {
        guard let draggedNode = draggedNode else { return }
        if draggedNode.position.y < size.height / 3 {
            draggedNode.removeFromParent()
            
            if let imageName = draggedNode.userData?["imageName"] as? String {
                arrayOfRecipe.insert(imageName)
                
                if arrayOfRecipe.count == 3 {
                    hideBonus()
                    showPrepareButton()
                } else {
                    let _ = checkElementsInNestedSets(elements: arrayOfRecipe, nestedSets: Array(returnRightRecept().values))
                    if !game!.isAnimationRunning {
                        game?.isAnimationRunning = true
                        createAnimationRightElement()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            self.game?.isAnimationRunning = false
                        }
                    }
                }
            }
        }
    }

    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.mainBackground.rawValue))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let bottle = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bottle.rawValue))
        bottle.name = "back"
        bottle.size = CGSize(width: 100, height: 100)
        bottle.position = CGPoint(x: size.width / 8, y: size.height / 1.147)
        addChild(bottle)
        
        let soundBackground = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.circleButtonBackground.rawValue))
        soundBackground.name = "soundBackground"
        soundBackground.size = CGSize(width: 85, height: 85)
        soundBackground.position = CGPoint(x: size.width / 1.15, y: size.height / 1.15)
        addChild(soundBackground)
        
        let sound = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.sound.rawValue))
        sound.name = "sound"
        sound.size = CGSize(width: 38, height: 30)
        sound.position = CGPoint(x: size.width / 1.15, y: size.height / 1.147)
        addChild(sound)
        
        let gameLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        gameLabel.attributedText = NSAttributedString(string: "GAME", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 45)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 247/255, green: 77/255, blue: 169/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor.white,
            NSAttributedString.Key.strokeWidth: -4
        ])
        gameLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.175)
        addChild(gameLabel)
        
        let backForTopLine = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.trainingBackForItem.rawValue))
        backForTopLine.size = CGSize(width: size.width, height: 150)
        backForTopLine.position = CGPoint(x: size.width / 2, y: size.height / 1.34)
        addChild(backForTopLine)
        
        let backForBottomLine = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.trainingBackForItemRevers.rawValue))
        backForBottomLine.size = CGSize(width: size.width, height: 150)
        backForBottomLine.position = CGPoint(x: size.width / 2, y: size.height / 1.64)
        addChild(backForBottomLine)
        
        let imageToPot = UserDefaultsManager().getSelectedPotImage()
        
        let pot = SKSpriteNode(texture: SKTexture(imageNamed: imageToPot ?? CandyImageName.shopItem1.rawValue))
        pot.name = "pot"
        pot.size = CGSize(width: size.width + 80, height: size.height * 0.6)
        pot.zPosition = 3
        pot.position = CGPoint(x: size.width / 2, y: size.height / 4.9)
        addChild(pot)
        
        let moneyBackground = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.moneyBackground.rawValue))
        moneyBackground.zPosition = 5
        moneyBackground.name = "moneyBackground"
        moneyBackground.size = CGSize(width: size.width * 0.25, height: size.height * 0.1)
        moneyBackground.position = CGPoint(x: size.width / 2, y: size.height / 6)
        addChild(moneyBackground)
        
        let coin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        coin.size = CGSize(width: size.width * 0.2, height: size.height * 0.08)
        coin.name = "coin"
        coin.position = CGPoint(x: size.width / 1.62, y: size.height / 6)
        coin.zPosition = 5
        addChild(coin)
        
        moneyLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        moneyLabel.name = "moneyLabel"
        moneyLabel.zPosition = 5
        moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaults.standard.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        moneyLabel.position = CGPoint(x: size.width / 2.11, y: size.height / 6.65)
        addChild(moneyLabel)
        
        let firstBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus1.rawValue))
        firstBonus.name = "firstBonus"
        firstBonus.zPosition = 5
        firstBonus.size = CGSize(width: 88, height: 88)
        firstBonus.position = CGPoint(x: size.width / 4, y: size.height / 12.5)
        addChild(firstBonus)
        
        let firstBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        firstBonusCoin.name = "firstBonusCoin"
        firstBonusCoin.zPosition = 5
        firstBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        firstBonusCoin.position = CGPoint(x: size.width / 3.2, y: size.height / 20)
        addChild(firstBonusCoin)
        
        let firstBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        firstBonusLabel.zPosition = 5
        firstBonusLabel.name = "firstBonusLabel"
        firstBonusLabel.attributedText = NSAttributedString(string: "100", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        firstBonusLabel.position = CGPoint(x: size.width / 3.4, y: size.height / 28.5)
        addChild(firstBonusLabel)
        
        let secondBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus2.rawValue))
        secondBonus.name = "secondBonus"
        secondBonus.zPosition = 5
        secondBonus.size = CGSize(width: 88, height: 88)
        secondBonus.position = CGPoint(x: size.width / 2, y: size.height / 12.5)
        addChild(secondBonus)
        
        let secondBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        secondBonusCoin.name = "secondBonusCoin"
        secondBonusCoin.zPosition = 5
        secondBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        secondBonusCoin.position = CGPoint(x: size.width / 1.75, y: size.height / 20)
        addChild(secondBonusCoin)
        
        let secondBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        secondBonusLabel.name = "secondBonusLabel"
        secondBonusLabel.zPosition = 5
        secondBonusLabel.attributedText = NSAttributedString(string: "150", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        secondBonusLabel.position = CGPoint(x: size.width / 1.8, y: size.height / 28.5)
        addChild(secondBonusLabel)
        
        let thirdBonus = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.bonus3.rawValue))
        thirdBonus.name = "thirdBonus"
        thirdBonus.zPosition = 5
        thirdBonus.size = CGSize(width: 80, height: 80)
        thirdBonus.position = CGPoint(x: size.width / 1.35, y: size.height / 12.5)
        addChild(thirdBonus)
        
        let thirdBonusCoin = SKSpriteNode(texture: SKTexture(imageNamed: CandyImageName.coin.rawValue))
        thirdBonusCoin.name = "thirdBonusCoin"
        thirdBonusCoin.zPosition = 5
        thirdBonusCoin.size = CGSize(width: size.width * 0.15, height: size.height * 0.06)
        thirdBonusCoin.position = CGPoint(x: size.width / 1.23, y: size.height / 20)
        addChild(thirdBonusCoin)
        
        let thirdBonusLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        thirdBonusLabel.name = "thirdBonusLabel"
        thirdBonusLabel.zPosition = 5
        thirdBonusLabel.attributedText = NSAttributedString(string: "250", attributes: [
            NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
            NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        thirdBonusLabel.position = CGPoint(x: size.width / 1.265, y: size.height / 28.5)
        addChild(thirdBonusLabel)
        
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 >= 3 {
            let timeLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
            timeLabel.zPosition = 5
            timeLabel.attributedText = NSAttributedString(string: "time", attributes: [
                NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                NSAttributedString.Key.foregroundColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                NSAttributedString.Key.strokeColor: UIColor.white,
                NSAttributedString.Key.strokeWidth: -6
            ])
            timeLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.225)
            addChild(timeLabel)
            
            
            time = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
            time.zPosition = 5
            time.attributedText = NSAttributedString(string: "\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
                NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                NSAttributedString.Key.foregroundColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                NSAttributedString.Key.strokeColor: UIColor.white,
                NSAttributedString.Key.strokeWidth: -6
            ])
            time.position = CGPoint(x: size.width / 2, y: size.height / 1.263)
            addChild(time)
        }
        
        createPartOfRecipe()
    }
    
    func doubleEarning(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "firstBonus" || tappedNode.name == "firstBonusCoin" || tappedNode.name == "firstBonusLabel" {
            if UserDefaultsManager().buySomething(cost: 100) {
                moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                    NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
                    NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -6
                ])
                game!.doubleMoney += game!.doubleMoney
            }
        }
    }
    
    func removeSpoiledItems(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "thirdBonus" || tappedNode.name == "thirdBonusCoin" || tappedNode.name == "thirdBonusLabel" {
            if UserDefaultsManager().buySomething(cost: 250) {
                if excludedItems.isEmpty {
                    excludedItems.insert(CandyImageName.greenItem.rawValue)
                    excludedItems.insert(CandyImageName.orangeItem.rawValue)
                    excludedItems.insert(CandyImageName.redItem.rawValue)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
                        self.excludedItems.remove(CandyImageName.greenItem.rawValue)
                        self.excludedItems.remove(CandyImageName.orangeItem.rawValue)
                        self.excludedItems.remove(CandyImageName.redItem.rawValue)
                    }
                }
                
                
                
                moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                    NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
                    NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -6
                ])
            }
        }
    }
    
    func addTime(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "secondBonus" || tappedNode.name == "secondBonusCoin" || tappedNode.name == "secondBonusLabel" {
            if UserDefaultsManager().buySomething(cost: 150) {
                game!.timeLeft += 30
                moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                    NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1),
                    NSAttributedString.Key.strokeColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -6
                ])
            }
        }
    }
    
    func returnRightRecept() -> [String: Set<String>] {
        if game!.array.isEmpty {
            if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 < 3 {
                game!.array = ["recipe1": Set(["partOfRecipe2", "partOfRecipe5", "partOfRecipe1"]),
                               "recipe2": Set(["partOfRecipe2", "partOfRecipe5", "partOfRecipe4"]),
                               "recipe3": Set(["partOfRecipe1", "partOfRecipe4", "partOfRecipe3"]),
                               "recipe4": Set(["partOfRecipe2", "partOfRecipe3", "partOfRecipe5"]),
                               "recipe5": Set(["partOfRecipe1", "partOfRecipe5", "partOfRecipe4"])]
            } else {
                game!.array = ["recipe6": Set(["part2OfRecept1", "part2OfRecept2", "partOfRecipe3"]),
                               "recipe7": Set(["part2OfRecept3", "part2OfRecept4", "part2OfRecept5"]),
                               "recipe8": Set(["part2OfRecept6", "partOfRecipe4", "partOfRecipe3"]),
                               "recipe9": Set(["partOfRecipe4", "partOfRecipe3", "partOfRecipe5"]),
                               "recipe10": Set(["partOfRecipe1", "part2OfRecept7", "partOfRecipe4"])]
            }
        }
        return game!.array
    }

    func findAndRemoveMatchingSet(set: inout Set<String>, in dictionary: inout [String: Set<String>]) -> String? {
        let sortedSet = Array(set).sorted()
        for (key, nestedSet) in dictionary {
            let sortedNestedSet = Array(nestedSet).sorted()
            if sortedSet == sortedNestedSet {
                if let indexToRemove = game!.array.firstIndex(where: { Array($0.value).sorted() == sortedNestedSet }) {
                    game!.array.remove(at: indexToRemove)
                }
                
                dictionary.removeValue(forKey: key)
                return key
            }
        }
        return nil
    }
    
    func showWin() {
        let darkOverlay = SKSpriteNode(color: UIColor.black.withAlphaComponent(0.5), size: self.size)
        darkOverlay.name = "darkOverlay"
        darkOverlay.position = CGPoint(x: size.width / 2, y: size.height / 2)
        darkOverlay.zPosition = 10
        addChild(darkOverlay)
        
        let pinkStyle = SKSpriteNode(imageNamed: CandyImageName.winPinkStyle.rawValue)
        pinkStyle.name = "pinkStyle"
        pinkStyle.size = CGSize(width: 365, height: 340)
        pinkStyle.position = CGPoint(x: size.width / 2, y:size.height / 2)
        pinkStyle.zPosition = 10
        addChild(pinkStyle)
        
        let winWhiteFigure = SKSpriteNode(imageNamed: CandyImageName.winWhiteFigure.rawValue)
        winWhiteFigure.name = "winWhiteFigure"
        winWhiteFigure.size = CGSize(width: 370, height: 450)
        winWhiteFigure.position = CGPoint(x: size.width / 2, y: size.height / 1.8)
        winWhiteFigure.zPosition = 10
        addChild(winWhiteFigure)
        
        let labels = ["wonderful!", "AMAZING!", "fantastic!", "incredible!", "unbelievable!"]
        
        
        if !arrayOfRecipe.isEmpty {
            var recipeDictionary = returnRightRecept()
            if let matchingKey = findAndRemoveMatchingSet(set: &arrayOfRecipe, in: &recipeDictionary) {
                let winRecipe = SKSpriteNode(imageNamed: matchingKey)
                winRecipe.name = "winRecipe"
                winRecipe.size = CGSize(width: 250, height: 250)
                winRecipe.position = CGPoint(x: size.width / 2.1, y: size.height / 1.9)
                winRecipe.zPosition = 10
                addChild(winRecipe)
                
                let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
                winLabel.name = "winLabel"
                winLabel.fontColor = .white
                winLabel.fontSize = 35
                winLabel.position = CGPoint(x: size.width / 2, y: size.height / 2.8)
                winLabel.zPosition = 10
                winLabel.text = labels.randomElement()
                addChild(winLabel)
            }
        } else {
            let winRecipe = SKSpriteNode(imageNamed: CandyImageName.win.rawValue)
            winRecipe.name = "winRecipe"
            winRecipe.size = CGSize(width: 250, height: 250)
            winRecipe.position = CGPoint(x: size.width / 2.1, y: size.height / 1.9)
            winRecipe.zPosition = 10
            addChild(winRecipe)
            
            let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
            winLabel.name = "winLabel"
            winLabel.fontColor = .white
            winLabel.fontSize = 35
            winLabel.position = CGPoint(x: size.width / 2, y: size.height / 2.8)
            winLabel.zPosition = 10
            winLabel.text = "YOU WIN!"
            addChild(winLabel)
            
          
        }
        
        let waitAction = SKAction.wait(forDuration: 2.0)
        let removeAction = SKAction.run {
            let nodeNamesToRemove = ["darkOverlay", "pinkStyle", "winWhiteFigure", "winLabel", "winRecipe"]
            for name in nodeNamesToRemove {
                if let nodeToRemove = self.childNode(withName: name) {
                    nodeToRemove.removeFromParent()
                    self.showBonus()
                    self.hidePrepare()
                }
            }
        }
        self.run(SKAction.sequence([waitAction, removeAction]))
        arrayOfRecipe.removeAll()
    }
    
    func showLose() {
        let darkOverlay = SKSpriteNode(color: UIColor.black.withAlphaComponent(0.5), size: self.size)
        darkOverlay.name = "darkOverlay"
        darkOverlay.position = CGPoint(x: size.width / 2, y: size.height / 2)
        darkOverlay.zPosition = 10
        addChild(darkOverlay)
        
        let redStyle = SKSpriteNode(imageNamed: CandyImageName.loseRedStyle.rawValue)
        redStyle.name = "redStyle"
        redStyle.size = CGSize(width: 365, height: 340)
        redStyle.position = CGPoint(x: size.width / 2, y:size.height / 2)
        redStyle.zPosition = 10
        addChild(redStyle)
        
        let winLabel = SKLabelNode(fontNamed: "LuckiestGuy-Regular")
        winLabel.name = "winLabel"
        winLabel.fontColor = .white
        winLabel.fontSize = 60
        winLabel.position = CGPoint(x: size.width / 2, y: size.height / 2.15)
        winLabel.zPosition = 10
        winLabel.text = "YOU LOOSE!"
        addChild(winLabel)
        
        
        let waitAction = SKAction.wait(forDuration: 2.0)
        let removeAction = SKAction.run {
            let nodeNamesToRemove = ["darkOverlay", "redStyle", "winLabel"]
            for name in nodeNamesToRemove {
                if let nodeToRemove = self.childNode(withName: name) {
                    nodeToRemove.removeFromParent()
                    self.showBonus()
                    self.hidePrepare()
                }
            }
        }
        self.run(SKAction.sequence([waitAction, removeAction]))
        arrayOfRecipe.removeAll()
    }
    
    func startTimer() {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 >= 3 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.updateTimer()
            }
        }
    }
    
    func updateTimer() {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 >= 3 {
            if game!.isWin == false || game!.isLevels == false {
                if game?.timeLeft ?? 0 > 0 {
                    game?.timeLeft -= 1
                    time.attributedText = NSAttributedString(string: "\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
                        NSAttributedString.Key.font: UIFont(name: "LuckiestGuy-Regular", size: 24)!,
                        NSAttributedString.Key.foregroundColor: UIColor(red: 124/255, green: 47/255, blue: 125/255, alpha: 1),
                        NSAttributedString.Key.strokeColor: UIColor.white,
                        NSAttributedString.Key.strokeWidth: -6
                    ])
                } else {
                    showLose()
                    timer?.invalidate()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                        self.game!.isLose = true
                    }
                }
            }
        }
    }
    
    func prepareTapped(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "prepareLabel" || tappedNode.name == "prepareBackButton" {
            let recipeDictionary = returnRightRecept()
            if compareSetWithNestedSets(set: arrayOfRecipe, nestedSets: Array(recipeDictionary.values)) {
                showWin()
                UserDefaultsManager().addCakeCount()
                
                if game!.array.isEmpty {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                        self.showWin()
                      
                        self.timer?.invalidate()
                        self.scene?.isPaused = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                            self.game!.isWin = true
                            UserDefaultsManager().doneLevel(with: self.game!.doubleMoney)
                        }
                    }
                }
            } else {
                if arrayOfRecipe.contains("redItem") {
                    showLose()
                    timer?.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                        self.game!.isLose = true
                    }
                } else if arrayOfRecipe.contains("greenItem") || arrayOfRecipe.contains("orangeItem") {
                    game!.timeLeft -= 20
                    hidePrepare()
                    showBonus()
                    arrayOfRecipe.removeAll()
                }
                hidePrepare()
                showBonus()
                arrayOfRecipe.removeAll()
            }
        }
    }
    
    func backTapped(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "back" {
            timer?.invalidate()
            game!.isLevels = true
        }
    }
}
