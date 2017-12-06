//
//  StretchExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

var stretchType = ExerciseType(name: "Stretch", icon: UIImage(named: "stretch-icon")!)

class StretchExercise: Exercise, NSCoding {
  var stretches: [Date: [String: Double]]

  init(name: String) {
    self.stretches = [Date: [String: Double]]()
    super.init(name: name, type: stretchType)
  }

  init(name: String, data: [Date: [String: Double]]) {
    self.stretches = data
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

  // MARK: NSCoding

  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.name, forKey: PropertyKey.name)
    aCoder.encode(self.stretches, forKey: PropertyKey.data)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
      else {
        os_log("Unable to decode the name for a Weight Exercise", log: OSLog.default, type: .debug)
        return nil
    }

    let stretches = aDecoder.decodeObject(forKey: PropertyKey.data) as? [Date: [String: Double]]

    self.init(name: name, data: stretches!)
  }
}
