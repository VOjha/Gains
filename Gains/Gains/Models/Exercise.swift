//
//  Exercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

struct ExerciseType {
  var name: String
  var icon: UIImage
}

class Exercise: NSObject {
  var name: String
  var type: ExerciseType

  init(name: String, type: ExerciseType) {
    self.name = name
    self.type = type
  }

  func getDictionaryWithoutData() -> NSMutableDictionary {
    let jsonable = NSMutableDictionary()

    jsonable["name"] = self.name
    jsonable["type"] = self.type.name

    return jsonable
  }

  func convertDatesToStrings(dataDict: Dictionary<Date, Any>) -> Dictionary<String, Any> {
    var resultDict = Dictionary<String, Any>()

    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"

    for (date, datum) in dataDict {
      resultDict[formatter.string(from: date)] = datum
    }

    return resultDict
  }
}
