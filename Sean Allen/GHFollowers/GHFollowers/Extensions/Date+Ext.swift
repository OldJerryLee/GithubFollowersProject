//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Fabricio Pujol on 07/03/22.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

