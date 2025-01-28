import SwiftUI

struct RectrangleButton: View {
    var action: (() -> ())
    var text: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var sizeText: CGFloat = 35
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.rectangleButtonBackground)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                
                Text(text)
                    .font(.custom("LuckiestGuy-Regular", size: sizeText))
                    .foregroundColor(.white)
                    .shadow(radius: 3, y: 5)
            }
        }
    }
}

struct WideButton: View {
    var action: (() -> ())
    var text: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.wideButtomBackground)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                
                Text(text)
                    .font(.custom("LuckiestGuy-Regular", size: 35))
                    .foregroundColor(.white)
                    .shadow(radius: 3, y: 5)
            }
        }
    }
}

struct CircleButton: View {
    var geometry: GeometryProxy
    var foregroundImage: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.circleButtonBackground)
                    .resizable()
                    .frame(width: geometry.size.width * 0.255,
                           height: geometry.size.width * 0.255)
                
                Image(foregroundImage)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
                    .offset(x: 1, y: -2.5)
            }
        }
    }
}

struct OpenLevel: View {
    var text: String
    var geometry: GeometryProxy
    var index: Int
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.openLevel)
                    .resizable()
                    .frame(width: geometry.size.width * 0.242, height: geometry.size.width * 0.242)
                
                Text(text)
                    .font(.custom("LuckiestGuy-Regular", size: 48))
                    .foregroundColor(.white)
                    .offset(y: 5)
            }
        }
        .disabled(index + 1 == UserDefaults.standard.object(forKey: Keys.currentLevel.rawValue) as! Int ? false : true)
    }
}

struct ClosedLevel: View {
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.closedLevel)
                .resizable()
                .frame(width: geometry.size.width * 0.242, height: geometry.size.width * 0.242)
            
            Text(text)
                .font(.custom("LuckiestGuy-Regular", size: 48))
                .foregroundColor(Color(red: 243/255, green: 231/255, blue: 247/255))
                .offset(y: 5)
        }
    }
}

struct AchievementsView: View {
    var text: String
    var image: String
    var cakeNeed: Int
    var index: Int
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        VStack {
            HStack(spacing: geometry.size.width * 0.051) {
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * 0.171,
                           height: geometry.size.width * 0.171)
                
                ZStack {
                    Text(text)
                        .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.04, alignment: .leading)
                        .font(.custom("LuckiestGuy-Regular", size: 15))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: geometry.size.width * 0.358, height: geometry.size.height * 0.06)
                        )
                        .padding(.trailing, geometry.size.width * 0.077)
                    
                    Button(action: {
                        action()
                    }) {
                        ZStack {
                            Image(.rectangleButtonBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.177, height: geometry.size.height * 0.058)
                            
                            Text("MORE")
                                .font(.custom("LuckiestGuy-Regular", size: 14))
                                .foregroundColor(.white)
                                .shadow(radius: 5, y: 5)
                        }
                    }
                    .offset(x: geometry.size.width * 0.104, y: geometry.size.height * 0.037)
                    if index == 4 {
                        if cakeNeed >= 10 {
                            Image(.done)
                                .resizable()
                                .frame(width: 20, height: 25)
                                .offset(x: geometry.size.width * 0.1, y: -geometry.size.width * 0.07)
                        }
                    } else {
                        if cakeNeed >= 1 {
                            Image(.done)
                                .resizable()
                                .frame(width: 20, height: 25)
                                .offset(x: geometry.size.width * 0.1, y: -geometry.size.width * 0.07)
                        }
                    }
                }
            }
        }
        .offset(x: -6)
    }
}

struct RecipeView: View {
    var geometry: GeometryProxy
    var imageOfRecipe: String
    var imagesPartOfRecipe: [String]
    var body: some View {
        VStack {
            HStack(spacing: geometry.size.width * 0.051) {
                HStack(spacing: 5) {
                    Image(imageOfRecipe)
                        .resizable()
                        .frame(width: geometry.size.width * 0.218,
                               height: geometry.size.width * 0.218)
                    
                    Image(.equal)
                        .resizable()
                        .frame(width: 10, height: 10)
                        .offset(x: -3)
                }
                
                ZStack {
                    HStack(spacing: 5) {
                        Image(imagesPartOfRecipe[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.118,
                                   height: geometry.size.width * 0.118)
                        
                        Image(imagesPartOfRecipe[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.118,
                                   height: geometry.size.width * 0.118)
                        
                        Image(imagesPartOfRecipe[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.118,
                                   height: geometry.size.width * 0.118)
                    }
                    .offset(x: -3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: geometry.size.width * 0.433,
                                       height: geometry.size.height * 0.076)
                        )
                }
            }
        }
        .offset(x: -15)
    }
}

struct FirstTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [RecipeModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
         
            
            VStack {
                VStack {
                    HStack {
                        BackButton(geometry: geometry) {

                        }
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
                            ForEach(recipe.indices, id: \.self) { index in
                                RecipeView(geometry: geometry, imageOfRecipe: recipe[index].recipeImage, imagesPartOfRecipe: recipe[index].partRecipeImages)
                            }
                        }
                    }
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Image(.wideButtomBackground)
                                .resizable()
                                .frame(width: 130, height: 60)
                            
                            Text("PLAY")
                                .font(.custom("LuckiestGuy-Regular", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    .offset(y: -35)
                }
                Spacer()
            }
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.198)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.058)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text("Welcome to the candy Chef game, here are the recipes you need to cook!")
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct SecondTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: recipe[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: recipe[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: recipe[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 1.6, y: geometry.size.height / 3)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text("Drag the necessary ingredients into the pot")
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct ThirdTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: recipe[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: recipe[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.17)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: 0)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.partOfRecipe1)
                .resizable()
                .frame(width: 70,
                       height: 70)
                .position(x: geometry.size.width / 2.2, y: geometry.size.height / 1.5)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.4)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text("Use the cursor to capture the desired product")
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct FourthTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: recipe[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: recipe[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.17)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: 0)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 3.3)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text("You need to drag all three products into the cauldron for the recipe.")
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct FifthTrainingView: View {
    var geometry: GeometryProxy
    var text: String
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: recipe[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: 0)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.17)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: 0)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.partOfRecipe5)
                .resizable()
                .frame(width: 70,
                       height: 70)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.4)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 1.9, y: geometry.size.height / 1.3)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text(text)
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct SixthTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: recipe[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: 0)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.17)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: 0)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 4.3, y: geometry.size.height / 3.5)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text("on higher bloodlines. You will need to prepare all the recipes in time.")
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct SeventhTrainingView: View {
    var text: String
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    BackButton(geometry: geometry) {
                        
                    }
                    .disabled(true)
                    Spacer()
                    
                    Text("GAME")
                        .LuckiestGuy(size: 45)
                    
                    Spacer()
                    
                    CircleButton(geometry: geometry,
                                 foregroundImage: CandyImageName.sound.rawValue,
                                 sizeW: geometry.size.width * 0.115,
                                 sizeH: geometry.size.height * 0.05) {
                        //disableSound
                    }
                                 .disabled(true)
                }
                
                VStack(spacing: -35) {
                    ZStack {
                        Image(.trainingBackForItem)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: geometry.size.height * 0.198)
                        HStack(spacing: 10) {
                                ZStack {
                                    Image(recipe[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe[0].size.width,
                                               height: 0)
                                }
                            
                            ZStack {
                                Image(recipe[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[1].size.width,
                                           height: 0)
                            }
                            
                            
                            ZStack {
                                Image(recipe[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.17)
                                
                                Image(recipe[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[2].size.width,
                                           height: 0)
                            }
                            
                            ZStack {
                                Image(recipe[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[3].size.width,
                                           height: recipe[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe[4].size.width,
                                           height: 50)
                                   
                            }
                            .offset(y: -3)
                        }
                        .offset(x: 19)
                    }
                    
                    ZStack {
                        Image(.trainingBackForItemRevers)
                            .resizable()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height * 0.198)
                        
                        HStack(spacing: 15) {
                                ZStack {
                                    Image(recipe2[0].ingredientsStyle)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.176,
                                               height: geometry.size.width * 0.205)
                                    
                                    Image(recipe2[0].ingredientsImage)
                                        .resizable()
                                        .frame(width: recipe2[0].size.width,
                                               height: recipe2[0].size.height)
                                }
                            
                            ZStack {
                                Image(recipe2[1].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[1].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[1].size.width,
                                           height: recipe2[1].size.height)
                            }
                            
                            
                            ZStack {
                                Image(recipe2[2].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[2].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[2].size.width,
                                           height: recipe2[2].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[3].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.176,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[3].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[3].size.width,
                                           height: recipe2[3].size.height)
                            }
                            
                            ZStack {
                                Image(recipe2[4].ingredientsStyle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.126,
                                           height: geometry.size.width * 0.205)
                                
                                Image(recipe2[4].ingredientsImage)
                                    .resizable()
                                    .frame(width: recipe2[4].size.width,
                                           height: recipe2[4].size.height)
                                   
                            }
                        }
                        .offset(x: -15)
                    }
                }
                Spacer()
            }
            
            Image(.shopItem1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width + 70,
                       height: geometry.size.height * 0.4)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.2)
            
            Image(.whiteRectangle)
                .resizable()
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.23)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 1.065)
            
            Image(.partOfRecipe2)
                .resizable()
                .frame(width: 70,
                       height: 70)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.3)
            
            Image(.cursor)
                .resizable()
                .frame(width: geometry.size.width * 0.35,
                       height: geometry.size.width * 0.35)
                .position(x: geometry.size.width / 1.8, y: geometry.size.height / 1.23)
            
            Image(.chef)
                .resizable()
                .frame(width: geometry.size.width * 0.84,
                       height: geometry.size.height * 0.515)
                .position(x: geometry.size.width / 1.72, y: geometry.size.height / 1.27)
            
            Text(text)
                .LuckiestGuy(size: 22,
                             color: .white,
                             colorOutline: Color(red: 103/255, green: 7/255, blue: 58/255))
                .minimumScaleFactor(0.8)
                .frame(width: geometry.size.width * 0.69,
                       height: geometry.size.height * 0.132, alignment: .topLeading)
                .position(x: geometry.size.width / 2.5, y: geometry.size.height / 1.05)
        }
    }
}

struct EightTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            SeventhTrainingView(text: "You can use bonuses to make the game run faster and better!",
                                geometry: geometry,
                                recipe: recipe,
                                recipe2: recipe2)
            
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            
            VStack {
                Text("Bonuses")
                    .LuckiestGuy(size: geometry.size.width * 0.115)
                
                ZStack {
                    Image(.achievementsBackground)
                        .resizable()
                        .frame(width: geometry.size.width * 0.815,
                               height: geometry.size.height * 0.725)
                    
                    VStack(spacing: geometry.size.height * 0.04) {
                        Text("Buy bonuses to speed up your game and earn more rewards!")
                            .font(.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundStyle(.white)
                            .minimumScaleFactor(0.8)
                            .frame(width: geometry.size.width * 0.55,
                                   height: geometry.size.height * 0.08)
                        
                        VStack(spacing: geometry.size.height * 0.04) {
                            BonusLabel(image: CandyImageName.bonus1.rawValue,
                                       countOfMoney: "100",
                                       text: "This bonus doubles your coin earnings!")
                            
                            BonusLabel(image: CandyImageName.bonus2.rawValue,
                                       countOfMoney: "150",
                                       text: "This bonus adds 30 seconds to your time!")
                            
                            BonusLabel(image: CandyImageName.bonus3.rawValue,
                                       countOfMoney: "250",
                                       text: "This bonus removes all spoiled products for 30 seconds!")
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Image(.rectangleButtonBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.382,
                                       height: geometry.size.height * 0.132)
                            
                            Text("BACK")
                                .font(.custom("LuckiestGuy-Regular", size: 35))
                                .foregroundStyle(.white)
                        }
                    }
                    .disabled(true)
                    .offset(y: geometry.size.height * 0.3823)
                }
            }
        }
    }
}


struct NinthTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            SeventhTrainingView(text: "You can use bonuses to make the game run faster and better!",
                                geometry: geometry,
                                recipe: recipe,
                                recipe2: recipe2)
            
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            
            VStack {
                ZStack {
                    Image(.winPinkStyle)
                        .resizable()
                        .frame(width: geometry.size.width * 0.93,
                               height: geometry.size.height * 0.448)
                    
                    Image(.winWhiteFigure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.978,
                               height: geometry.size.height * 0.684)
                    
                    Image(.recipe1)
                        .resizable()
                        .frame(width: geometry.size.width * 0.78,
                               height: geometry.size.height * 0.404)
                        .offset(x: -15)
                    
                    Text("wonderful!")
                        .font(.custom("LuckiestGuy-Regular", size: 35))
                        .foregroundColor(.white)
                        .shadow(radius: 0, y: 5)
                        .offset(y: geometry.size.height * 0.185)
                }
                
            }
        }
    }
}

struct TenthTrainingView: View {
    var geometry: GeometryProxy
    var recipe: [IngredientsModel]
    var recipe2: [IngredientsModel]
    var body: some View {
        ZStack {
            SeventhTrainingView(text: "You can use bonuses to make the game run faster and better!",
                                geometry: geometry,
                                recipe: recipe,
                                recipe2: recipe2)
            
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            
            VStack {
                ZStack {
                    Image(.winPinkStyle)
                        .resizable()
                        .frame(width: geometry.size.width * 0.93,
                               height: geometry.size.height * 0.448)
                    
                    Image(.winWhiteFigure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.978,
                               height: geometry.size.height * 0.684)
                    
                    Image(.win)
                        .resizable()
                        .frame(width: geometry.size.width * 0.78,
                               height: geometry.size.height * 0.404)
                        .offset(y: -25)
                    
                    Text("you win!")
                        .font(.custom("LuckiestGuy-Regular", size: 35))
                        .foregroundColor(.white)
                        .shadow(radius: 0, y: 5)
                        .offset(y: geometry.size.height * 0.145)
                    
                    HStack(spacing: -10) {
                        Text("+100")
                            .LuckiestGuy(size: 30,
                                         color: Color(red: 124/255, green: 47/255, blue: 125/255),
                                         colorOutline: .white)
                       
                        
                        Image(.coin)
                            .resizable()
                            .frame(width: 68, height: 60)
                            .offset(y: -5)
                    }
                    .offset(y: geometry.size.height * 0.211)
                }
            }
        }
    }
}

struct ShopItemView: View {
    var text: String
    var textButton: String
    var isSelected: Bool
    var image: String
    var geometry: GeometryProxy
    var sizeW: CGFloat
    var sizeH: CGFloat
    var offset: CGFloat
    var action: (() -> ())
    var body: some View {
        VStack {
            HStack(spacing: geometry.size.width * 0.09) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: sizeW,
                           height: sizeH)
                    .offset(y: offset)
                
                ZStack {
                    Text(text)
                        .frame(width: geometry.size.width * 0.23, height: geometry.size.height * 0.04, alignment: .leading)
                        .font(.custom("LuckiestGuy-Regular", size: 15))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .offset(x: -15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 3)
                                .frame(width: geometry.size.width * 0.358, height: geometry.size.height * 0.06)
                        )
                        .padding(.trailing, geometry.size.width * 0.077)
                    
                    
                    Button(action: {
                        action()
                    }) {
                        ZStack {
                            Image(.rectangleButtonBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.177, height: geometry.size.height * 0.058)
                            
                            Text(textButton)
                                .font(.custom("LuckiestGuy-Regular", size: 11))
                                .foregroundColor(.white)
                                .shadow(radius: 5, y: 5)
                        }
                    }
                    .offset(x: geometry.size.width * 0.104, y: geometry.size.height * 0.04)
                    
                    if !isSelected {
                        HStack(spacing: 0) {
                            Text("100")
                                .LuckiestGuy(size: 10, color: Color(red: 124/255, green: 47/255, blue: 125/255))
                            
                            Image(.coin)
                                .resizable()
                                .frame(width: geometry.size.width * 0.086, height: geometry.size.height * 0.046)
                                .offset(y: -2)
                        }
                        .offset(x: geometry.size.width * 0.12, y: -geometry.size.width * 0.035)
                    } else {
                        Image(.done)
                            .resizable()
                            .frame(width: 20, height: 25)
                            .offset(x: geometry.size.width * 0.1, y: -geometry.size.width * 0.08)
                    }
                }
            }
        }
        .offset(x: -geometry.size.width * 0.035)
    }
}

struct MoneyLabel: View {
    var text: String
    var body: some View {
        ZStack {
            Image(.moneyBackground)
                .resizable()
                .frame(width: 75, height: 75)
            
            Image(.coin)
                .resizable()
                .frame(width: 63, height: 57)
                .offset(x: 35, y: -1)
            
            Text(text)
                .LuckiestGuy(size: 20,
                             color: Color(red: 255/255, green: 195/255, blue: 1/255),
                             colorOutline: Color(red: 124/255, green: 47/255, blue: 125/255))
                .offset(x: -8, y: 2)
        }
        .offset(y: -5)
        .padding(.trailing, 50)
    }
}

struct BackButton: View {
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.bottle)
                    .resizable()
                    .frame(width: geometry.size.width * 0.264,
                           height: geometry.size.width * 0.264)
                
                Text("BACK")
                    .LuckiestGuy(size: 17, color: Color(red: 122/255, green: 76/255, blue: 247/255))
                    .offset(y: 35)
            }
        }
        .padding(.leading, 5)
    }
}

struct DetailAchievements: View {
    var image: String
    var name: String
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.detailAchivBackground)
                .resizable()
                .frame(width: geometry.size.width * 0.943,
                       height: geometry.size.height * 0.277)
            
            HStack(spacing: 20) {
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * 0.166,
                           height: geometry.size.width * 0.166)
                
                Text(name)
                    .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.04, alignment: .leading)
                    .font(.custom("LuckiestGuy-Regular", size: 15))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: geometry.size.width * 0.358, height: geometry.size.height * 0.067)
                    )
                    .padding(.trailing, geometry.size.width * 0.077)
            }
            .offset(x: -geometry.size.width * 0.128, y: -geometry.size.height * 0.066)
            
            Text(text)
                .frame(width: geometry.size.width * 0.611, height: geometry.size.height * 0.103)
                .font(.custom("LuckiestGuy-Regular", size: 13))
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .offset(x: 30, y: 35)
        }
    }
}


struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 170, height: 55)
                .foregroundColor(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                                            .stroke(Color(red: 196/255, green: 50/255, blue: 129/255), lineWidth: 4)
                }
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 75, height: 55)
                        .foregroundColor(Color(red: 204/255, green: 0/255, blue: 255/255))
                        .offset(x: isOn ? 95 : 0)
                        .overlay {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                    .stroke(Color(red: 196/255, green: 50/255, blue: 129/255), lineWidth: 4)
                                                    .offset(x: isOn ? 95 : 0)
                            
                            Text(isOn ? "ON" : "OFF")
                                .font(.custom("LuckiestGuy-Regular", size: 24))
                                .foregroundColor(.white)
                                .offset(x: isOn ? 95 : 0, y: 2)
                        }
                }
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

struct ItemRules: View {
    var styleImage: String
    var itemImage: String
    var itemWSize: CGFloat
    var itemHSize: CGFloat
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        HStack {
            ZStack {
                Image(styleImage)
                    .resizable()
                    .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.133)
                
                Image(itemImage)
                    .resizable()
                    .frame(width: itemWSize, height: itemHSize)
            }
            
            Image(.vector)
                .resizable()
                .frame(width: 13, height: 5)
                .offset(x: -20)
            
            Text(text)
                .frame(width: geometry.size.width * 0.418, height: geometry.size.height * 0.051)
                .font(.custom("LuckiestGuy-Regular", size: 15))
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .offset(x: -20)
        }
    }
}

struct BonusLabel: View {
    var image: String
    var countOfMoney: String
    var text: String
    var body: some View {
        HStack(spacing: 5) {
            ZStack {
            Image(image)
                .resizable()
                .frame(width: 88, height: 87)
            
                ZStack {
                    Image(.coin)
                        .resizable()
                        .frame(width: 63, height: 57)
                    
                    Text(countOfMoney)
                        .LuckiestGuy(size: 20,
                                     color: Color(red: 255/255, green: 195/255, blue: 1/255),
                                     colorOutline: Color(red: 124/255, green: 47/255, blue: 125/255))
                        .offset(x: -5, y: 4)
                }
                .offset(x: 25, y: 30)
            }
            
            Image(.vector)
                .resizable()
                .frame(width: 10, height: 4)
            
            Text(text)
                .font(.custom("LuckiestGuy-Regular", size: 13))
                .minimumScaleFactor(0.7)
                .foregroundStyle(.white)
                .frame(width: 143, height: 29, alignment: .leading)
        }
    }
}
