//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 15/04/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}