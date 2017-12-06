//
//  WeightExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

var weightType = ExerciseType(name: "Weight", icon: UIImage(named: "weight-icon")!)

class WeightExercise: Exercise, NSCoding {

  var weights: [Date: [String: Double]]

  init(name: String) {
    self.weights = [Date: [String: Double]]()
    super.init(name: name, type: weightType)
  }

  init(name: String, data: [Date: [String: Double]]) {
    self.weights = data
    super.init(name: name, type: weightType)
  }

  func addDataPoint(date: Date, weight: Double, sets: Double, reps: Double) {
    var data = [String: Double]()
    data["weight"] = weight
    data["sets"] = sets
    data["reps"] = reps
    self.weights[date] = data;
  }

  func toDictionary() -> NSMutableDictionary {
    let jsonable = getDictionaryWithoutData()
    jsonable["data"] = convertDatesToStrings(dataDict: self.weights)

    return jsonable
  }

  // MARK: NSCoding

  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.name, forKey: PropertyKey.name)
    aCoder.encode(self.weights, forKey: PropertyKey.data)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
      else {
        os_log("Unable to decode the name for a Weight Exercise", log: OSLog.default, type: .debug)
        return nil
    }

    let weights = aDecoder.decodeObject(forKey: PropertyKey.data) as? [Date: [String: Double]]

    self.init(name: name, data: weights!)
  }
}
