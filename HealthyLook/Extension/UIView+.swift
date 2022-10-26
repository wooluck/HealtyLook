//
//  UIView+.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/26.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0)}
    }
}
