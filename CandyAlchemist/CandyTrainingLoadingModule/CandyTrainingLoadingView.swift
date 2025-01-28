import SwiftUI

struct CandyTrainingLoadingView: View {
    @StateObject var сandyTrainingLoadingModel =  CandyTrainingLoadingViewModel()
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
                        Text("TRAINING")
                            .LuckiestGuy(size: 64)
                        
                        Text("PREPARE ALL THE RECIPES")
                            .LuckiestGuy(size: 24)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(сandyTrainingLoadingModel.currentText)
                            .LuckiestGuy(size: 20)
                        
                        ZStack {
                            Image(.loadingLineBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.79,
                                       height: 23)
                            
                            Color(Color(red: 76/255, green: 65/255, blue: 180/255))
                                .frame(width: geometry.size.width * сandyTrainingLoadingModel.contact.widthArray[сandyTrainingLoadingModel.currentIndex],
                                       height: 11)
                                .cornerRadius(20)
                                .offset(x: geometry.size.width *  сandyTrainingLoadingModel.contact.offsetArray[сandyTrainingLoadingModel.currentIndex], y: -3)
                        }
                        
                        Text(сandyTrainingLoadingModel.contact.procentArray[сandyTrainingLoadingModel.currentIndex])
                            .LuckiestGuy(size: 20)
                    }
                    .padding(.bottom, 10)
                }
            }
            .onAppear {
                сandyTrainingLoadingModel.startTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    сandyTrainingLoadingModel.currentIndex = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    сandyTrainingLoadingModel.currentIndex = 2
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    router.showTraining()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyTrainingLoadingView(router: router)
}

