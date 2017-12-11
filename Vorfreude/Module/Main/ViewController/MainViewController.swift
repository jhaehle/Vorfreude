//
//  MainViewController.swift
//  Vorfreude
//
//  Created by Ahmet Yalcinkaya on 11.12.2017.
//  Copyright © 2017 Vorfreude. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var santaGifView: UIImageView!
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gifTapped(tapGestureRecognizer:)))
        santaGifView.isUserInteractionEnabled = true
        santaGifView.addGestureRecognizer(gesture)
    }
    
    // MARK: - Prepare

    func prepareUI() {
        let formatter = DateFormatter()
        var currentYear = getYear()
        formatter.dateFormat = "yyyy-MM-dd"
        let thisXmas = formatter.date(from: "\(currentYear)-12-24")!
        
        var days = calculateDays(from: Date(), to: thisXmas)
        
        if days < 0 {
            currentYear = currentYear + 1
            let nextXmas = formatter.date(from: "\(currentYear)-12-24")!
            days = calculateDays(from: Date(), to: nextXmas)
        }
        
        remainingTimeLabel.text = "\(days) Tage"
    }
    
    // MARK: - Calculations
    
    func calculateDays(from: Date, to date: Date) -> Int {
        let days = from.days(to: date)
        return days
    }

    func getYear() -> Int {
        let now = Date()
        let calendar = NSCalendar.current
        let anchorComponents = calendar.dateComponents(Set<Calendar.Component>([.year]), from: now)
        return anchorComponents.year ?? 2017
    }
    
    // MARK: - Actions
    
    @objc func gifTapped(tapGestureRecognizer: UITapGestureRecognizer) {

    }
}
