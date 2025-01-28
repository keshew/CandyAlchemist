import SwiftUI

struct CandyAchievementsView: View {
    @StateObject var candyAchievementsModel =  CandyAchievementsViewModel()
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
                            
                            Text("ACHIEVEMENTS")
                                .LuckiestGuy(size: 35)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Image(.achievementsBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.77, height: 550)
                            
                            VStack {
                                ForEach(candyAchievementsModel.contact.arrayOfAchievements.indices, id: \.self) { index in
                                    AchievementsView(text: candyAchievementsModel.contact.arrayOfAchievements[index].text,
                                                     image: candyAchievementsModel.contact.arrayOfAchievements[index].image,
                                                     cakeNeed: UserDefaults.standard.object(forKey: Keys.firstCake.rawValue) as? Int ?? 0,
                                                     index: index,
                                                     geometry: geometry) {
                                        router.showDetailAchievements(achivModel: candyAchievementsModel.contact.arrayOfAchievements[index])
                                    }
                                                     .padding(.bottom, 20)
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
                .scrollIndicators(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyAchievementsView(router: router)
}

