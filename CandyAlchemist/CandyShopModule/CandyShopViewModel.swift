import SwiftUI

class CandyShopViewModel: ObservableObject {
    let contact = CandyShopModel()
    @Published var arrayOfShopItems = UserDefaultsManager().loadShoItems()
}
