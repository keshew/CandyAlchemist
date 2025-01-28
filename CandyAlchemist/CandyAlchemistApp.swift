import SwiftUI

@main
struct CandyAlchemistApp: App {
    var body: some Scene {
        WindowGroup {
            CandyLoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
