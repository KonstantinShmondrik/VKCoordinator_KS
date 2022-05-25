//
//  CircleShadowModifier.swift
//  VKCoordinator_KS
//
//  Created by Константин Шмондрик on 25.05.2022.
//

import SwiftUI

struct CircleShadowModifier: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor,
                        radius: shadowRadius,
                        x: x,
                        y: y))
    }
    
}
