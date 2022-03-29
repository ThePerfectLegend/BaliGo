//
//  Custom Corners.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 21.06.2021.
//

import SwiftUI

struct Custom_Corners: Shape {

    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
    
}


