import SwiftUI

struct CandyShopView: View {
    @StateObject var candyShopModel =  CandyShopViewModel()
    @ObservedObject var router: Router
    @ObservedObject var buyModel = UserDefaultsManager()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        VStack {
                            VStack {
                                HStack {
                                    BackButton(geometry: geometry) {
                                        router.back()
                                    }
                                    
                                    Spacer()
                                    
                                    MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                                }
                                
                                Text("Shop")
                                    .LuckiestGuy(size: 45)
                            }
                        }
                        
                        ZStack {
                            Image(.achievementsBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.82, height: 550)
                            
                            VStack {
                                ForEach(buyModel.arrayOfShopItems.indices, id: \.self) { index in
                                    if buyModel.arrayOfShopItems[index].isAvailible {
                                        ShopItemView(
                                            text: buyModel.arrayOfShopItems[index].text,
                                            textButton: "SELECT",
                                            isSelected: buyModel.arrayOfShopItems[index].isAvailible,
                                            image: buyModel.arrayOfShopItems[index].image,
                                            geometry: geometry,
                                            sizeW: geometry.size.width * buyModel.arrayOfShopItems[index].size.width,
                                            sizeH: geometry.size.width * buyModel.arrayOfShopItems[index].size.height,
                                            offset: buyModel.arrayOfShopItems[index].offset,
                                            action: {
                                                buyModel.manageShopItem(at: index)
                                            }
                                        )
                                        .padding(.bottom, geometry.size.height * 0.005)
                                    } else if buyModel.arrayOfShopItems[index].isSelected {
                                        ShopItemView(
                                            text: buyModel.arrayOfShopItems[index].text,
                                            textButton: "SELECTED",
                                            isSelected: buyModel.arrayOfShopItems[index].isSelected,
                                            image: buyModel.arrayOfShopItems[index].image,
                                            geometry: geometry,
                                            sizeW: geometry.size.width * buyModel.arrayOfShopItems[index].size.width,
                                            sizeH: geometry.size.width * buyModel.arrayOfShopItems[index].size.height,
                                            offset: buyModel.arrayOfShopItems[index].offset,
                                            action: {
                                                //disabled
                                            }
                                        )
                                        .disabled(true)
                                        .padding(.bottom, geometry.size.height * 0.005)
                                    } else {
                                        ShopItemView(
                                            text: buyModel.arrayOfShopItems[index].text,
                                            textButton: "BUY",
                                            isSelected: buyModel.arrayOfShopItems[index].isSelected,
                                            image: buyModel.arrayOfShopItems[index].image,
                                            geometry: geometry,
                                            sizeW: geometry.size.width * buyModel.arrayOfShopItems[index].size.width,
                                            sizeH: geometry.size.width * buyModel.arrayOfShopItems[index].size.height,
                                            offset: buyModel.arrayOfShopItems[index].offset,
                                            action: {
                                                buyModel.manageShopItem(at: index)
                                            }
                                        )
                                        .padding(.bottom, geometry.size.height * 0.005)
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 20) {
                            CircleButton(geometry: geometry,
                                         foregroundImage: CandyImageName.setting.rawValue,
                                         sizeW: geometry.size.width * 0.18,
                                         sizeH: geometry.size.height * 0.067) {
                                router.showSettings()
                            }
                            
                            CircleButton(geometry: geometry,
                                         foregroundImage: CandyImageName.rules.rawValue,
                                         sizeW: geometry.size.width * 0.14,
                                         sizeH: geometry.size.height * 0.056) {
                                router.showRules()
                            }
                            
                            CircleButton(geometry: geometry,
                                         foregroundImage: CandyImageName.sound.rawValue,
                                         sizeW: geometry.size.width * 0.115,
                                         sizeH: geometry.size.height * 0.05) {
                                //disableSound
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyShopView(router: router)
}

