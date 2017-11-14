//
//  CardioExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

var cardioType = ExerciseType(name: "Cardio", icon: UIImage(named: "cardio-icon")!)

class CardioExercise: Exercise {
  var times: [NSDate: CGFloat]

  init(name: String) {
    self.times = [NSDate: CGFloat]()
    super.init(name: name, type: cardioType)
  }

  func addDataPoint(date: NSDate, minutes: CGFloat, seconds: CGFloat) {
    self.times[date] = minutes + (seconds/60.0)
  }
}
