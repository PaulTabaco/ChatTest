//
//  DateExtensions.swift
//  ChatTest
//
//  Created by Paul on 06.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

extension Date {
    
    static func from(_ stringDate: String?) -> Date? {
        guard let stringDate = stringDate else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Globals.Dates.DateFromServer
        return dateFormatter.date(from: stringDate)
    }
    
    func startOfTheDay() -> Date {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        return calendar.startOfDay(for: self)
    }
    
    func getDayAndTime() -> String {
        return dateToString(with: Globals.Dates.DayAndTime)
    }
        
    private func dateToString(with dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
}
