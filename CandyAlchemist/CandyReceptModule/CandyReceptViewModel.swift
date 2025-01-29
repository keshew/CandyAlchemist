import SwiftUI

class CandyReceptViewModel: ObservableObject {
    var contact = CandyReceptModel()
    
    func setArray() -> [RecipeModel] {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0 <= 2 {
            contact.arrayOfRecipe = [RecipeModel(recipeImage: CandyImageName.recipe1.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe2.rawValue,
                                                                    CandyImageName.partOfRecipe5.rawValue,
                                                                    CandyImageName.partOfRecipe1.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe2.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe2.rawValue,
                                                                    CandyImageName.partOfRecipe5.rawValue,
                                                                    CandyImageName.partOfRecipe4.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe3.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe1.rawValue,
                                                                    CandyImageName.partOfRecipe4.rawValue,
                                                                    CandyImageName.partOfRecipe3.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe4.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe2.rawValue,
                                                                    CandyImageName.partOfRecipe3.rawValue,
                                                                    CandyImageName.partOfRecipe5.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe5.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe1.rawValue,
                                                                    CandyImageName.partOfRecipe5.rawValue,
                                                                    CandyImageName.partOfRecipe4.rawValue])]
        } else {
            contact.arrayOfRecipe = [RecipeModel(recipeImage: CandyImageName.recipe6.rawValue,
                                                 partRecipeImages: [CandyImageName.part2OfRecept1.rawValue,
                                                                    CandyImageName.part2OfRecept2.rawValue,
                                                                    CandyImageName.partOfRecipe3.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe7.rawValue,
                                                 partRecipeImages: [CandyImageName.part2OfRecept3.rawValue,
                                                                    CandyImageName.part2OfRecept4.rawValue,
                                                                    CandyImageName.part2OfRecept5.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe8.rawValue,
                                                 partRecipeImages: [CandyImageName.part2OfRecept6.rawValue,
                                                                    CandyImageName.partOfRecipe4.rawValue,
                                                                    CandyImageName.partOfRecipe3.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe9.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe4.rawValue,
                                                                    CandyImageName.partOfRecipe3.rawValue,
                                                                    CandyImageName.partOfRecipe5.rawValue]),
                                     RecipeModel(recipeImage: CandyImageName.recipe10.rawValue,
                                                 partRecipeImages: [CandyImageName.partOfRecipe1.rawValue,
                                                                    CandyImageName.part2OfRecept7.rawValue,
                                                                    CandyImageName.partOfRecipe4.rawValue])]
        }
        return contact.arrayOfRecipe
    }
}
