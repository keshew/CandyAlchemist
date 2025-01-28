import SwiftUI
import Combine

enum Keys: String {
    case countOfMoney = "countOfMoney"
    case shopItems = "shopItems"
    case currentLevel = "currentLevel"
    case firstCake = "firstCake"
}

class UserDefaultsManager: ObservableObject {
    static let defaults = UserDefaults.standard
    @Published var arrayOfShopItems: [ShopItemModel] = [ShopItemModel(text: "Sugar Steam Cauldron",
                                                                      image: CandyImageName.shopItem1.rawValue,
                                                                      size: CGSize(width: 0.208, height: 0.211),
                                                                      offset: -10,
                                                                      isSelected: true,
                                                                      isAvailible: false),
                                                        ShopItemModel(text: "Candy Concoction Kettle",
                                                                      image: CandyImageName.shopItem2.rawValue,
                                                                      size: CGSize(width: 0.208, height: 0.265),
                                                                      offset: -15,
                                                                      isSelected: false,
                                                                      isAvailible: false),
                                                        ShopItemModel(text: "Sweetness Sizzle Pot",
                                                                      image: CandyImageName.shopItem3.rawValue,
                                                                      size: CGSize(width: 0.208, height: 0.211),
                                                                      offset: -10,
                                                                      isSelected: false,
                                                                      isAvailible: false),
                                                        ShopItemModel(text: "Fudge Fusion Boiler",
                                                                      image: CandyImageName.shopItem4.rawValue,
                                                                      size: CGSize(width: 0.208, height: 0.225),
                                                                      offset: -10,
                                                                      isSelected: false,
                                                                      isAvailible: false),
                                                        ShopItemModel(text: "Lollipop Lava Cauldron",
                                                                      image: CandyImageName.shopItem5.rawValue,
                                                                      size: CGSize(width: 0.208, height: 0.171),
                                                                      offset: 0,
                                                                      isSelected: false,
                                                                      isAvailible: false)]
    
    init() {
        if let savedItems = loadShoItems() {
            self.arrayOfShopItems = savedItems
        }
    }
    
    func loadShoItems() -> [ShopItemModel]? {
        if let savedItemsData = UserDefaultsManager.defaults.data(forKey: Keys.shopItems.rawValue) {
            let decoder = JSONDecoder()
            if let loadedShopItems = try? decoder.decode([ShopItemModel].self, from: savedItemsData) {
                return loadedShopItems
            }
        }
        return nil
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.countOfMoney.rawValue) == nil {
            UserDefaultsManager.defaults.set(1000, forKey: Keys.countOfMoney.rawValue)
            UserDefaultsManager.defaults.set(1,  forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(0,  forKey: Keys.firstCake.rawValue)
            saveShopItems(array: arrayOfShopItems)
        }
    }
    
    func saveShopItems(array: [ShopItemModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.shopItems.rawValue)
        }
    }
    
    func saveShopItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(arrayOfShopItems) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.shopItems.rawValue)
        }
    }
    
    func manageShopItem(at index: Int) {
        guard index >= 0 && index < arrayOfShopItems.count else { return }
        
        var selectedItem = arrayOfShopItems[index]
        
        if selectedItem.isSelected {
            return
        }
        
        if selectedItem.isAvailible {
            for i in 0..<arrayOfShopItems.count {
                if arrayOfShopItems[i].isSelected {
                    arrayOfShopItems[i].isSelected = false
                    arrayOfShopItems[i].isAvailible = true
                    break
                }
            }
            
            selectedItem.isSelected = true
            selectedItem.isAvailible = false
        } else {
            let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.countOfMoney.rawValue)
            if countOfMoney >= 100 {
                selectedItem.isAvailible = true
                
                for i in 0..<arrayOfShopItems.count {
                    if arrayOfShopItems[i].isSelected {
                        arrayOfShopItems[i].isSelected = false
                        arrayOfShopItems[i].isAvailible = true
                        break
                    }
                }
                
                selectedItem.isSelected = true
                selectedItem.isAvailible = false
                
                UserDefaultsManager.defaults.set(countOfMoney - 100, forKey: Keys.countOfMoney.rawValue)
            }
        }
        arrayOfShopItems[index] = selectedItem
        saveShopItems()
    }
    
    func getSelectedPotImage() -> String? {
        for shopItem in arrayOfShopItems {
            if shopItem.isSelected {
                return shopItem.image
            }
        }
        return nil
    }
    
    func checkFirstLaunch() -> Bool {
        var isFirstLaunch = false
        let hasBeenLaunchedBefore = UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore")
        if !hasBeenLaunchedBefore {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            isFirstLaunch = true
        } else {
            isFirstLaunch = false
        }
        return isFirstLaunch
    }
    
    func buySomething(cost: Int) -> Bool {
        var isEnough = false
        let countMoney = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        if countMoney >= cost {
            UserDefaultsManager.defaults.set(countMoney - cost, forKey: Keys.countOfMoney.rawValue)
            isEnough = true
        }
        return isEnough
    }
    
    func doneLevel(with: Int) {
        let countLevel = UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0
        let countMoney = UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(countLevel + 1, forKey: Keys.currentLevel.rawValue)
        UserDefaultsManager.defaults.set(countMoney + with, forKey: Keys.countOfMoney.rawValue)
    }
    
    func addCakeCount() {
        let countCake = UserDefaultsManager.defaults.object(forKey: Keys.firstCake.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(countCake + 1, forKey: Keys.firstCake.rawValue)
    }
}
