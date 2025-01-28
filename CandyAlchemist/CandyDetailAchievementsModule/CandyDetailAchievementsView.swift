import SwiftUI

struct CandyDetailAchievementsView: View {
    @StateObject var candyDetailAchievementsModel =  CandyDetailAchievementsViewModel()
    @ObservedObject var router: Router
    var achivModel: AchievementsModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        BackButton(geometry: geometry) {
                            router.back()
                        }
                        Spacer()
                        MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("ACHIEVEMENTS")
                            .LuckiestGuy(size: 35)
                        
                        DetailAchievements(image: achivModel.image,
                                           name: "\(achivModel.text)",
                                           text: "\(achivModel.description)",
                                           geometry: geometry)
                        
                        RectrangleButton(action: {
                            router.back()
                        }, text: "Back", sizeW: 125, sizeH: 80, sizeText: 24)
                    }
                    
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let achievementsModel = AchievementsModel(text: "", image: "", description: "")
    @ObservedObject var router = Router()
    return CandyDetailAchievementsView(router: router, achivModel: achievementsModel)
}

