//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 15/04/22.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    func removeExcessCells () {
        tableFooterView = UIView(frame: .zero)
    }
}
