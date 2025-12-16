//
//  Pie.swift
//  Memorize
//
//  Created by Qi Han on 12/15/25.
//

import SwiftUI

struct Pie: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        // Use a triangle to show an example.
        p.move(to: CGPoint(x: rect.midX, y: rect.minY))   // 顶点
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // 右下
        p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // 左下
        p.closeSubpath()

        return p
    }
}
