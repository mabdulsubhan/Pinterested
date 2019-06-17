//
//  DateTimeUtility.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

struct DateTimeUtility {
    
    /// Converts string to date in 'yyyy-MM-dd' format
    ///
    /// - Parameter dateString: string of date in yyyy-MM-dd format
    /// - Returns: Date object
    static func getReleaseDateFromString(dateString: String) -> Date? {
        return DateFormatter.shortFormatDateFormatter.date(from: dateString)
    }
    
    
    /// Converts date to 'dd MMMM yyyy' string
    ///
    /// - Parameter shortFormatDate: Date object
    /// - Returns: String in dd MMMM yyyy format
    static func convertToLongDateFormat(from shortFormatDate: Date?) -> String?  {
        guard  let date = shortFormatDate else {
            return nil
        }
        return  DateFormatter.fullFormatDateFormatter.string(from: date)
    }
}
