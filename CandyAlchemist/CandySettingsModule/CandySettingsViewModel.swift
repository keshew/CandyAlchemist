import SwiftUI

class CandySettingsViewModel: ObservableObject {
    let contact = CandySettingsModel()
    @Published var isSongsOn = false
    @Published var isSondsOn = false
}
