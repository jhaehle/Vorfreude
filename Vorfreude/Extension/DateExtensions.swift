//
//  DateExtensions.swift
//  Vorfreude
//
//  Created by Ahmet Yalcinkaya on 11.12.2017.
//  Copyright © 2017 Vorfreude. All rights reserved.
//

import UIKit

extension Date {
    func days(to date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: date).day!
    }
}
