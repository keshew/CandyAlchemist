import SwiftUI

struct CandyLevelView: View {
    @StateObject var candyLevelModel =  CandyLevelViewModel()
    @ObservedObject var router: Router
    
    var couint = 1
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                VStack(spacing: 10) {
                    VStack {
                        HStack {
                            BackButton(geometry: geometry) {
                                router.back()
                            }
                            Spacer()
                            MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                        }
                        
                        Text("LEVELS")
                            .LuckiestGuy(size: 45)
                    }
                    
                    Spacer()
                    
                        LazyVGrid(columns: candyLevelModel.columns, spacing: 10) {
                            ForEach(0..<12, id: \.self) { index in
                                if index <  UserDefaults.standard.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 {
                                    OpenLevel(text: "\(index + 1)",
                                              geometry: geometry,
                                              index: index) {
                                        if UserDefaultsManager().checkFirstLaunch() {
                                            router.showTrainingLoading()
                                        } else {
                                            router.showGameLoading()
                                        }
                                    }
                                } else {
                                    ClosedLevel(text: "\(index + 1)", geometry: geometry)
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
                    .padding(.top, geometry.size.height * 0.068)
                }
                .scrollIndicators(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyLevelView(router: router)
}

