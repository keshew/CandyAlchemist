import SwiftUI

class CandyLevelViewModel: ObservableObject {
    let contact = CandyLevelModel()
    let columns = [
          GridItem(.flexible(), spacing: -50),
          GridItem(.flexible(), spacing: -50),
          GridItem(.flexible(), spacing: -50)
      ]
}
