//
//  ConstantsHelper.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

struct Colors {
  static let themeRedColor = UIColor(red: (255.0/255.0), green: (91.0/255.0), blue: (98.0/255.0), alpha: 1.0)
  static let themeBlueColor = UIColor(red: (0.0/255.0), green: (122.0/255.0), blue: (255.0/255.0), alpha: 1.0)
  static let themeYellowColor = UIColor(red: (252.0/255.0), green: (209.0/255.0), blue: (78.0/255.0), alpha: 1.0)
}

struct Fonts {
  static let textFieldFont = UIFont(name: "Rubik-Light", size: 25)
  static let textFieldLabelFont = UIFont(name: "Rubik-Medium", size: 17)
  static let exerciseTypeTitleFont = UIFont(name: "Rubik-Bold", size: 35)
  static let selectTypeTitleFont = UIFont(name: "Rubik-Bold", size: 25)
  static let selectTypeLabelFont = UIFont(name: "Rubik-Regular", size: 30)
  static let buttonFont = UIFont(name: "Rubik-Regular", size: 20)
  static let landingPageTitleFont = UIFont(name: "Rubik-Bold", size: 30)
}

struct DatePickerDefaults {
  static let defaultMinYear = 2000
  static let defaultMaxYear = Calendar.current.component(.year, from: Date())
  static let defaultRowHeight = 50
}

struct SizeConstants {
  static let newWeightScreenHeight = CGFloat(770)
  static let newStretchScreenHeight = CGFloat(670)
}
