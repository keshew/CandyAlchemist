import SwiftUI

struct CandySettingsView: View {
    @StateObject var candySettingsModel =  CandySettingsViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        HStack {
                            BackButton(geometry: geometry) {
                                router.back()
                            }
                            
                            Spacer()
                            
                            MoneyLabel(text: "\(UserDefaultsManager.defaults.object(forKey: Keys.countOfMoney.rawValue) ?? 0)")
                        }
                        
                        Text("SETTINGS")
                            .LuckiestGuy(size: 35)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 50) {
                        VStack {
                            Text("SONGS")
                                .LuckiestGuy(size: 40)
                            
                            ZStack {
                                Image(.detailAchivBackground)
                                    .resizable()
                                    .frame(width: 325, height: 110)
                                
                                Toggle("", isOn: $candySettingsModel.isSongsOn)
                                    .toggleStyle(CustomToggle())
                            }
                        }
                        
                        VStack {
                            Text("SOUNDS")
                                .LuckiestGuy(size: 40)
                            
                            ZStack {
                                Image(.detailAchivBackground)
                                    .resizable()
                                    .frame(width: 325, height: 110)
                                
                                Toggle("", isOn: $candySettingsModel.isSondsOn)
                                    .toggleStyle(CustomToggle())
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        CircleButton(geometry: geometry,
                                     foregroundImage: CandyImageName.setting.rawValue,
                                     sizeW: geometry.size.width * 0.18,
                                     sizeH: geometry.size.height * 0.067) {
                            //disabled
                        }
                                     .disabled(true)
                        
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
    @ObservedObject var router = Router()
    return CandySettingsView(router: router)
}

