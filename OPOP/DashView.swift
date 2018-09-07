//
//  DashView.swift
//  OPOP
//
//  Created by Nathakorn on 8/23/18.
//  Copyright © 2018 Nathakorn. All rights reserved.
//

import UIKit

class DashView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: rect.height / 2))
        path.setLineDash([1, 15], count: 2, phase: 0)
        path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height / 2))
        path.lineCapStyle = .round
        path.lineWidth = 1
        
        path.stroke()
    }

}
