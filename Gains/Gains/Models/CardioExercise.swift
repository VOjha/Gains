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
  var times: [Date: Double]

  init(name: String) {
    self.times = [Date: Double]()
    super.init(name: name, type: cardioType)
  }

  func addDataPoint(date: Date, minutes: Double, seconds: Double) {
    self.times[date] = minutes + (seconds/60.0)
  }
}
