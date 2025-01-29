import SwiftUI

struct CandyLoadingView: View {
    @StateObject var candyLoadingModel =  CandyLoadingViewModel()
    @ObservedObject var router = Router()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $router.path) {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        VStack(spacing: 0) {
                            Image(.bottle)
                                .resizable()
                                .frame(width: geometry.size.width * 0.705,
                                       height: geometry.size.width * 0.705)
                            
                            VStack(spacing: 20) {
                                Text("CANDY ALCHEMIST")
                                    .LuckiestGuy(size: 42)
                                
                                Text("The alchemy of taste")
                                    .LuckiestGuy(size: 22)
                            }
                        }
                        .padding(.top, 5)
                        Spacer()
                        
                        VStack {
                            Text(candyLoadingModel.currentText)
                                .LuckiestGuy(size: 20)
                            
                            ZStack {
                                Image(.loadingLineBackground)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.79,
                                           height: 23)
                                
                                Color(Color(red: 76/255, green: 65/255, blue: 180/255))
                                    .frame(width: geometry.size.width * candyLoadingModel.contact.widthArray[candyLoadingModel.currentIndex],
                                           height: 11)
                                    .cornerRadius(20)
                                    .offset(x: geometry.size.width *  candyLoadingModel.contact.offsetArray[candyLoadingModel.currentIndex], y: -3)
                            }
                            
                            Text(candyLoadingModel.contact.procentArray[candyLoadingModel.currentIndex])
                                .LuckiestGuy(size: 20)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .menu:
                        CandyMenuView(router: router)
                    case .level:
                        CandyLevelView(router: router)
                    case .achievements:
                        CandyAchievementsView(router: router)
                    case .detailAchievements(let achivModel):
                        CandyDetailAchievementsView(router: router, achivModel: achivModel)
                    case .settings:
                        CandySettingsView(router: router)
                    case .rules:
                        CandyRulesView(router: router)
                    case .shop:
                        CandyShopView(router: router)
                    case .trainingLoading:
                        CandyTrainingLoadingView(router: router)
                    case .training:
                        CandyTrainingView(router: router)
                    case .gameLoading:
                        CandyGameLoadingModuleView(router: router)
                    case .game:
                        CandyGameModuleView(router: router)
                    case .recept:
                        CandyReceptView(router: router)
                    }
                }
                
                .onAppear {
                    candyLoadingModel.startTimer()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        candyLoadingModel.currentIndex = 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        candyLoadingModel.currentIndex = 2
                        router.showMenu()
                    }
                }
            }
        }
    }
}

#Preview {
    CandyLoadingView()
}

