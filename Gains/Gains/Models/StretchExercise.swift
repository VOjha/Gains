//
//  StretchExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

var stretchType = ExerciseType(name: "Stretch", icon: UIImage(named: "stretch-icon")!)

class StretchExercise: Exercise {
  var stretches: [NSDate: [String: CGFloat]]

  init(name: String) {
    self.stretches = [NSDate: [String: CGFloat]]()
    super.init(name: name, type: stretchType)
  }

  func addDataPoint(date: NSDate, sets: CGFloat, reps: CGFloat) {
    var data = [String: CGFloat]()
    data["sets"] = sets
    data["reps"] = reps
    self.stretches[date] = data
  }
}
