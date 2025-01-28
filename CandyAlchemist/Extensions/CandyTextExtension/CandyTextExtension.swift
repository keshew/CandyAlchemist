import SwiftUI

extension Text {
    func LuckiestGuy(size: CGFloat,
                    color: Color = Color(red: 247/255, green: 77/255, blue: 169/255),
                    outlineWidth: CGFloat = 0.8,
                    colorOutline: Color = .white) -> some View {
        self.font(.custom("LuckiestGuy-Regular", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

