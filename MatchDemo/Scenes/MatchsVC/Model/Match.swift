//
//  Match.swift
//  MatchDemo
//
//  Created by Ahmed Abo Elsood on 07/02/2024.
//

import Foundation

struct Match {
    let name: String
    let startTime: Date
    
    static func createSampleData() -> [Match] {
        let date = Date()
        let match1 = Match(name: "Match A", startTime:date.stringToDate("2024-02-07T16:00:00"))
        let match3 = Match(name: "Match b", startTime: date.stringToDate("2024-02-08T22:30:00"))
        let match2 = Match(name: "Match c", startTime: date.stringToDate("2024-02-07T13:30:00"))
        let match4 = Match(name: "Match D", startTime: date.stringToDate("2024-02-09T12:59:00"))
        let match5 = Match(name: "Match e", startTime: date.stringToDate("2024-02-05T15:30:00"))
        let match6 = Match(name: "Match f", startTime: date.stringToDate("2024-02-09T14:30:00"))
        let match7 = Match(name: "Match A", startTime:date.stringToDate("2024-02-07T16:00:00"))
        let match8 = Match(name: "Match b", startTime: date.stringToDate("2024-02-08T22:30:00"))
        let match9 = Match(name: "Match c", startTime: date.stringToDate("2024-02-07T13:30:00"))
        let match10 = Match(name: "Match D", startTime: date.stringToDate("2024-02-09T12:59:00"))
        let matc11 = Match(name: "Match e", startTime: date.stringToDate("2024-02-05T15:30:00"))
        let match12 = Match(name: "Match f", startTime: date.stringToDate("2024-02-09T14:30:00"))
        
        return [match1, match2, match3 , match4 , match5 , match6,match7,match8,match9,match10,matc11,match12]
    }
}
