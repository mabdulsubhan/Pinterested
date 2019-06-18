//
//  Date+Extensions.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

extension Date {
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return "\(year)Y"
        } else if let month = interval.month, month > 0 {
            return "\(month)M"
        } else if let day = interval.day, day > 0 {
            return "\(day)D"
        } else if let hour = interval.hour, hour > 0 {
            return "\(hour)H"
        } else if let minute = interval.minute, minute > 0 {
            return "\(minute)M"
        } else {
            return "Just Now"
            
        }
        
    }
}
