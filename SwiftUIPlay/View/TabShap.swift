//
//  TabShap.swift
//  SwiftUIPlay
//
//  Created by lym on 2023/5/12.
//

import SwiftUI

struct TabShap: Shape {
    var midpoint: CGFloat

    var animatableData: CGFloat {
        get { midpoint }
        set {
            midpoint = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.addPath(Rectangle().path(in: rect))

            path.move(to: .init(x: midpoint - 60, y: 0))

            let to1 = CGPoint(x: midpoint, y: -25)
            let c1 = CGPoint(x: midpoint - 25, y: 0)
            let c2 = CGPoint(x: midpoint - 25, y: -25)
            path.addCurve(to: to1, control1: c1, control2: c2)

            let to2 = CGPoint(x: midpoint + 60, y: 0)
            let c3 = CGPoint(x: midpoint + 25, y: -25)
            let c4 = CGPoint(x: midpoint + 25, y: 0)
            path.addCurve(to: to2, control1: c3, control2: c4)
        }
    }
}

