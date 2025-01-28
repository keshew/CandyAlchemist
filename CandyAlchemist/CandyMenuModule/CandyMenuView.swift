import SwiftUI

struct CandyMenuView: View {
    @StateObject var candyMenuModel =  CandyMenuViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                    }
                    
                    VStack(spacing: -5) {
                        Image(.bottle)
                            .resizable()
                            .frame(width: geometry.size.width * 0.591,
                                   height: geometry.size.width * 0.591)
                            .padding(.top, -20)
                        
                        Text("MENU")
                            .LuckiestGuy(size: 45)
                            .padding(.top, -10)
                        Spacer()
                        
                        VStack {
                            HStack(spacing: 15) {
                                RectrangleButton(action: {
                                    router.showLevel()
                                }, text: "LEVELS",
                                                 sizeW: geometry.size.width * 0.435,
                                                 sizeH: geometry.size.height * 0.145)
                                
                                RectrangleButton(action: {
                                    router.showShop()
                                }, text: "SHOP",
                                                 sizeW: geometry.size.width * 0.435,
                                                 sizeH: geometry.size.height * 0.145)
                            }
                            
                            WideButton(action: {
                                router.showAchievements()
                            }, text: "Achievements",
                                       sizeW: geometry.size.width * 0.815,
                                       sizeH: geometry.size.height * 0.139)
                            
                        }
                        .padding(.top, -20)
                        
                        Spacer()
                        
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
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyMenuView(router: router)
}

