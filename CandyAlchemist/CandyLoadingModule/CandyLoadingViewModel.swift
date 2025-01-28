import SwiftUI

class CandyLoadingViewModel: ObservableObject {
    let contact = CandyLoadingModel()
    @Published var currentIndex = 0
    @Published var currentText = "LOADING..."
    @Published var index = 0
    @Published var timer: Timer?
    
    func startTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
             self.changeText()
         }
     }
    
    func changeText() {
        index -= 1
        if index == -1 {
            index = 2
        }
        currentText = contact.loadingArray[index]
     }
}
