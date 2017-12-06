//
//  CardioExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

var cardioType = ExerciseType(name: "Cardio", icon: UIImage(named: "cardio-icon")!)

class CardioExercise: Exercise, NSCoding {
  var times: [Date: Double]

  init(name: String) {
    self.times = [Date: Double]()
    super.init(name: name, type: cardioType)
  }

  init(name: String, data: [Date: Double]) {
    self.times = data
    super.init(name: name, type: cardioType)
  }

  func addDataPoint(date: Date, minutes: Double, seconds: Double) {
    self.times[date] = minutes + (seconds/60.0)
  }

  func toDictionary() -> NSMutableDictionary {
    let jsonable = getDictionaryWithoutData()
    jsonable["data"] = convertDatesToStrings(dataDict: self.times)

    return jsonable
  }

  // MARK: NSCoding

  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.name, forKey: PropertyKey.name)
    aCoder.encode(self.times, forKey: PropertyKey.data)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
      else {
        os_log("Unable to decode the name for a Weight Exercise", log: OSLog.default, type: .debug)
        return nil
    }

    let times = aDecoder.decodeObject(forKey: PropertyKey.data) as? [Date: Double]

    self.init(name: name, data: times!)
  }
}
