import SwiftUI

struct CandyReceptView: View {
    @StateObject var candyReceptModel =  CandyReceptViewModel()
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack {
                    VStack {
                        HStack {
                            Button(action: {
                                router.showLevel()
                            }) {
                                ZStack {
                                    Image(.bottle)
                                        .resizable()
                                        .frame(width: 80,
                                               height: 80)
                                
                                    Text("BACK")
                                        .LuckiestGuy(size: 17, color: Color(red: 122/255, green: 76/255, blue: 247/255))
                                        .offset(y: 35)
                                }
                            }
                            .padding(.leading, 5)
                            Spacer()
                        }
                        
                        Text("Recipes")
                            .LuckiestGuy(size: 45)
                    }
                    
                    VStack {
                        ZStack {
                            Image(.achievementsBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.8653,
                                       height: geometry.size.height * 0.725)
                            
                            VStack {
                                ForEach(candyReceptModel.setArray().indices, id: \.self) { index in
                                    RecipeView(geometry: geometry,
                                               imageOfRecipe: candyReceptModel.setArray()[index].recipeImage,
                                               imagesPartOfRecipe: candyReceptModel.setArray()[index].partRecipeImages)
                                }
                            }
                        }
                        Button(action: {
                            router.showGame()
                        }) {
                            ZStack {
                                Image(.wideButtomBackground)
                                    .resizable()
                                    .frame(width: 160, height: 100)
                                
                                Text("PLAY")
                                    .font(.custom("LuckiestGuy-Regular", size: 35))
                                    .foregroundColor(.white)
                            }
                        }
                        .offset(y: -60)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return CandyReceptView(router: router)
}

