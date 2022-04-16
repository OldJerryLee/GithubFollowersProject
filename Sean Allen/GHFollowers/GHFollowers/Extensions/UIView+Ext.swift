//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 15/04/22.
//

import UIKit

extension UIView {
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        ])
    }

    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
