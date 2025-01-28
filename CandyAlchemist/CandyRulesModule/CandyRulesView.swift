import SwiftUI

struct CandyRulesView: View {
    @StateObject var candyRulesModel =  CandyRulesViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                BackButton(geometry: geometry) {
                                    router.back()
                                }
                                
                                Spacer()
                                
                                MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                            }
                            
                            Text("RULES")
                                .LuckiestGuy(size: 45)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Image(.achievementsBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.891, height: geometry.size.height * 0.725)
                            
                            Text("Do not add salt, pepper, or any other undesirable ingredients to your recipe. Adding these will spoil your creation and ruin the fun!")
                                .frame(width: geometry.size.width * 0.595, height: geometry.size.height * 0.165)
                                .font(.custom("LuckiestGuy-Regular", size: 18))
                                .minimumScaleFactor(0.5)
                                .foregroundColor(.white)
                                .offset(y: -geometry.size.height * 0.225)
                            
                            VStack(spacing: -15) {
                                ItemRules(styleImage: CandyImageName.greenStyle.rawValue,
                                          itemImage: CandyImageName.greenItem.rawValue,
                                          itemWSize: 40,
                                          itemHSize: 54,
                                          text: "bad ingredients are highlighted in green",
                                          geometry: geometry)
                                
                                ItemRules(styleImage: CandyImageName.whiteStyle.rawValue,
                                          itemImage: CandyImageName.whiteItem.rawValue,
                                          itemWSize: 40,
                                          itemHSize: 54,
                                          text: "ready meals are highlighted in white",
                                          geometry: geometry)
                                
                                ItemRules(styleImage: CandyImageName.redStyle.rawValue,
                                          itemImage: CandyImageName.redItem.rawValue,
                                          itemWSize: 80,
                                          itemHSize: 82,
                                          text: "bad ingredients are highlighted in red",
                                          geometry: geometry)
                                
                                ItemRules(styleImage: CandyImageName.pinkStyle.rawValue,
                                          itemImage: CandyImageName.pinkItem.rawValue,
                                          itemWSize: 59,
                                          itemHSize: 59,
                                          text: "bad ingredients are highlighted in pink",
                                          geometry: geometry)
                            }
                            .offset(y: geometry.size.height * 0.093)
                            
                       
                        }
                        WideButton(action: {
                            router.showGame()
                        }, text: "Play", sizeW: geometry.size.width * 0.57, sizeH: geometry.size.height * 0.133)
                        .offset(y: -geometry.size.height * 0.06)
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
    return CandyRulesView(router: router)
}

