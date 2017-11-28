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
  var stretches: [Date: [String: Double]]

  init(name: String) {
    self.stretches = [Date: [String: Double]]()
    super.init(name: name, type: stretchType)
  }

  func addDataPoint(date: Date, sets: Double, reps: Double) {
    var data = [String: Double]()
    data["sets"] = sets
    data["reps"] = reps
    self.stretches[date] = data
  }

  func toDictionary() -> NSMutableDictionary {
    let jsonable = getDictionaryWithoutData()
    jsonable["data"] = convertDatesToStrings(dataDict: self.stretches)

    return jsonable
  }
}
