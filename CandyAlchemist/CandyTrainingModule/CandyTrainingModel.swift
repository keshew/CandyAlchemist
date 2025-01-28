import SwiftUI

struct RecipeModel {
    var recipeImage: String
    var partRecipeImages: [String]
}

struct IngredientsModel {
    var ingredientsImage: String
    var ingredientsStyle: String
    var size: CGSize
}

struct CandyTrainingModel {
    let arrayOfRecipe = [RecipeModel(recipeImage: CandyImageName.recipe1.rawValue,
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
    
    let arrayOfIngredients = [IngredientsModel(ingredientsImage: CandyImageName.partOfRecipe2.rawValue,
                                               ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                               size: CGSize(width: 70, height: 70)),
                              IngredientsModel(ingredientsImage: CandyImageName.partOfRecipe5.rawValue,
                                               ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                               size: CGSize(width: 70, height: 70)),
                              IngredientsModel(ingredientsImage: CandyImageName.partOfRecipe1.rawValue,
                                               ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                               size: CGSize(width: 70, height: 70)),
                              IngredientsModel(ingredientsImage: CandyImageName.partOfRecipe4.rawValue,
                                               ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                               size: CGSize(width: 70, height: 70)),
                              IngredientsModel(ingredientsImage: CandyImageName.halfStrawberry.rawValue,
                                               ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                               size: CGSize(width: 35, height: 55))]
    
    let secondArrayOfIngredients = [IngredientsModel(ingredientsImage: CandyImageName.partOfRecipe7.rawValue,
                                                     ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                                     size: CGSize(width: 50, height: 60)),
                                    IngredientsModel(ingredientsImage: CandyImageName.greenItem.rawValue,
                                                     ingredientsStyle: CandyImageName.greenStyle.rawValue,
                                                     size: CGSize(width: 55, height: 60)),
                                    IngredientsModel(ingredientsImage: CandyImageName.whiteBottleItem.rawValue,
                                                     ingredientsStyle: CandyImageName.greenStyle.rawValue,
                                                     size: CGSize(width: 50, height: 60)),
                                    IngredientsModel(ingredientsImage: CandyImageName.pepperItem.rawValue,
                                                     ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                                     size: CGSize(width: 70, height: 60)),
                                    IngredientsModel(ingredientsImage: CandyImageName.orangeItem.rawValue,
                                                     ingredientsStyle: CandyImageName.whiteStyle.rawValue,
                                                     size: CGSize(width: 55, height: 60))]
    
    
}


