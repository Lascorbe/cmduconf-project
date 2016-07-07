//
//  UIImage+Utils.swift
//  cmduconf
//
//  Created by Luis Ascorbe Martínez on 06/07/16.
//  Copyright © 2016 @lascorbe. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        color.setFill()
        UIBezierPath(rect: rect).fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage!)
    }
}
