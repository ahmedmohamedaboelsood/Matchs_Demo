//
//  MatcheCell.swift
//  MatchDemo
//
//  Created by Ahmed Abo Elsood on 05/02/2024.
//

import UIKit

class MatcheCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    //MARK: - Methods
    
    func configure(with match: Match) {
        nameLabel.text = "Match: \(match.name)"
        startTimeLabel.text = "Start Time: \(match.startTime.toString(withFormat: "HH:mm:ss"))"
        remainingTimeLabel.text = "Time Remaining: \(calculateTimeRemaining(match: match))"
    }
    
    
    func calculateTimeRemaining(match: Match) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day,.hour, .minute, .second], from: currentDate, to: match.startTime)
        if let hours = components.hour, let minutes = components.minute , let seconds = components.second {
            if hours > 0 {
                return "\(hours) : \(minutes) : \(seconds)"
            } else if minutes > 0 {
                return "00 :\(minutes) : \(seconds)"
            }else if seconds > 0 {
                return "00 : \(seconds)"
            }else {
                return "Started"
            }
        } else {
            return "N/A"
        }
    }
    
}
