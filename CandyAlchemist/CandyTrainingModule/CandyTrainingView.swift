import SwiftUI

struct CandyTrainingView: View {
    @StateObject var candyTrainingModel =  CandyTrainingViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            candyTrainingModel.returnView(geometry: geometry)
                .onTapGesture {
                    if candyTrainingModel.currentIndex != 12 {
                        candyTrainingModel.currentIndex += 1
                    } else {
                        router.showGameLoading()
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyTrainingView(router: router)
}



