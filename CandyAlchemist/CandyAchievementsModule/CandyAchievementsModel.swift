import SwiftUI

struct AchievementsModel: Hashable, Equatable {
    var text: String
    var image: String
    var description: String
}

struct CandyAchievementsModel {
    let arrayOfAchievements = [AchievementsModel(text: "1. Cake Master",
                                                 image: CandyImageName.achiv1.rawValue,
                                                 description: "To unlock the Cake Master achievement, you need to successfully create your first cake in the game. Gather the required ingredients, mix them together, and bake your delicious creation to earn this milestone!"),
                               AchievementsModel(text: "2. Layered Perfection",
                                                 image: CandyImageName.achiv2.rawValue,
                                                 description: "To get the “Layered Perfection” achievement, you need to successfully create a cake with no unnecessary ingredients. Gather only the necessary ingredients and bake your delicious creation to get this achievement!"),
                               AchievementsModel(text: "3. Sweet Surprise",
                                                 image: CandyImageName.achiv3.rawValue,
                                                 description: "To get the “Sweet Surprise” achievement, you need to successfully create a cake with a special ingredient. Collect only this ingredient and bake your delicious creation to get this achievement!"),
                               AchievementsModel(text: "4. Frosting Guru",
                                                 image: CandyImageName.achiv4.rawValue,
                                                 description: "To get the “Frosting Guru” achievement, you need to successfully create a cake with a perfect coating. Bake your delicious creation, and cover it with the perfect icing to get this achievement!"),
                               AchievementsModel(text: "5. Baking Champion",
                                                 image: CandyImageName.achiv5.rawValue,
                                                 description: "To get the “Baking Champion” achievement, you need to successfully create a cake 10 times! Bake your delicious creation 10 times to get this achievement!")]
}


