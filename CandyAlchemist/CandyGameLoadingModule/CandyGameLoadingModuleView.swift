import SwiftUI

struct CandyGameLoadingModuleView: View {
    @StateObject var candyGameLoadingModuleModel =  CandyGameLoadingModuleViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("LEVEL \(UserDefaults.standard.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0)")
                            .LuckiestGuy(size: 64)
                        
                        Text("PREPARE ALL THE RECIPES")
                            .LuckiestGuy(size: 24)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(candyGameLoadingModuleModel.currentText)
                            .LuckiestGuy(size: 20)
                        
                        ZStack {
                            Image(.loadingLineBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.79,
                                       height: 23)
                            
                            Color(Color(red: 76/255, green: 65/255, blue: 180/255))
                                .frame(width: geometry.size.width * candyGameLoadingModuleModel.contact.widthArray[candyGameLoadingModuleModel.currentIndex],
                                       height: 11)
                                .cornerRadius(20)
                                .offset(x: geometry.size.width *  candyGameLoadingModuleModel.contact.offsetArray[candyGameLoadingModuleModel.currentIndex], y: -3)
                        }
                        
                        Text(candyGameLoadingModuleModel.contact.procentArray[candyGameLoadingModuleModel.currentIndex])
                            .LuckiestGuy(size: 20)
                    }
                    .padding(.bottom, 10)
                }
            }
            .onAppear {
                candyGameLoadingModuleModel.startTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    candyGameLoadingModuleModel.currentIndex = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    candyGameLoadingModuleModel.currentIndex = 2
                    router.showGame()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    router.showGame()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyGameLoadingModuleView(router: router)
}

