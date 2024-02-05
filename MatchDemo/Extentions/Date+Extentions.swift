//
//  Date+Extentions.swift
//  MatchDemo
//
//  Created by Ahmed Abo Elsood on 07/02/2024.
//

import Foundation

extension Date{
    
    func stringToDate(_ string: String)->Date{
        let dateString = string
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            return Date()
        }
    }
    
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
