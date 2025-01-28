import SwiftUI

class CandyTrainingViewModel: ObservableObject {
    let contact = CandyTrainingModel()
    @Published var currentIndex = 0
    
    @ViewBuilder
    func returnView(geometry: GeometryProxy) -> some View {
        switch currentIndex {
        case 0:
            FirstTrainingView(geometry: geometry, recipe: contact.arrayOfRecipe)
        case 1:
            SecondTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 2:
            ThirdTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 3:
            FourthTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 4:
            FifthTrainingView(geometry: geometry, text: "To win the game, prepare all the recipes on the list!", recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 5:
            FifthTrainingView(geometry: geometry, text: "If the ingredient is added correctly, it will sparkle with sparkles.", recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 6:
            SixthTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 7:
            SeventhTrainingView(text: "Try to remember all the recipes as best you can", geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 8:
            SeventhTrainingView(text: "As soon as all the recipes are ready, you will win!", geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 9:
            SeventhTrainingView(text: "You can use bonuses to make the game run faster and better!", geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 10:
            EightTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 11:
            NinthTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        case 12:
            TenthTrainingView(geometry: geometry, recipe: contact.arrayOfIngredients, recipe2: contact.secondArrayOfIngredients)
        default:
            FirstTrainingView(geometry: geometry, recipe: contact.arrayOfRecipe)
        }
    }
}
