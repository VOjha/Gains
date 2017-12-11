//
//  ExercisePickerView.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/29/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class ExercisePicker: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var pickerView: UIPickerView!

  var selectedExercise: Exercise
  var selectedType: SelectedType

  var cardioKeys: [String]
  var stretchKeys: [String]
  var weightKeys: [String]

  var exercisesStore: Exercises

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

  override init(frame: CGRect) {
    selectedExercise = Exercise(name: "Nil", type: noneType)
    selectedType = SelectedType.NONE

    cardioKeys = []
    stretchKeys = []
    weightKeys = []

    exercisesStore = Exercises()

    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    selectedExercise = Exercise(name: "Nil", type: noneType)
    selectedType = SelectedType.NONE

    cardioKeys = []
    stretchKeys = []
    weightKeys = []

    exercisesStore = Exercises()

    super.init(coder: aDecoder)
    commonInit()
  }

  private func commonInit() {
    Bundle.main.loadNibNamed("ExercisePicker", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    pickerView.delegate = self
    pickerView.dataSource = self

    pickerView.reloadAllComponents()
    pickerView.selectRow(0, inComponent: 0, animated: false)

    appDelegate.exercises?.loadExercises()

    cardioKeys = (appDelegate.exercises?.cardioExerciseKeys())!
    stretchKeys = (appDelegate.exercises?.stretchExerciseKeys())!
    weightKeys = (appDelegate.exercises?.weightExerciseKeys())!

    exercisesStore = appDelegate.exercises!
    pickExerciseAtIndex(index: 0)
  }

  func setSelectedType(selectType: SelectedType) {
    selectedType = selectType
  }

  // UIPickerViewDataSource

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch selectedType {
    case SelectedType.CARDIO:
      let numCardio = cardioKeys.count
      return (numCardio == 0) ? 1 : numCardio
    case SelectedType.STRETCH:
      let numStretch = stretchKeys.count
      return (numStretch == 0) ? 1 : numStretch
    case SelectedType.WEIGHT:
      let numWeight = weightKeys.count
      return (numWeight == 0) ? 1 : numWeight
    default:
      return 1
    }
  }

  // UIPickerViewDelegate

  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    var label = view as? UILabel
    if (label == nil) {
      label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(pickerView.frame.size.width), height: DatePickerDefaults.defaultRowHeight))
    }

    label?.font = Fonts.textFieldFont
    label?.textColor = Colors.themeBlueColor
    label?.textAlignment = .center

    var title = ""
    switch selectedType {
    case SelectedType.CARDIO:
      let numCardio = cardioKeys.count
      title = (numCardio == 0) ? "No Cardio Exercises" : cardioKeys[row]
    case SelectedType.STRETCH:
      let numStretch = stretchKeys.count
      title = (numStretch == 0) ? "No Stretch Exercises" : stretchKeys[row]
    case SelectedType.WEIGHT:
      let numWeight = weightKeys.count
      title = (numWeight == 0) ? "No Weight Exercises" : weightKeys[row]
    default:
      selectedExercise = Exercise(name: "Nil", type: noneType)
      title = "No Type Selected"
    }

    label?.text = title
    return label!
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickExerciseAtIndex(index: row)
  }

  func pickExerciseAtIndex(index: Int) {
    switch selectedType {
    case SelectedType.CARDIO:
      let numCardio = cardioKeys.count
      if (numCardio == 0) {
        selectedExercise = Exercise(name: "Nil", type: noneType)
      } else {
       selectedExercise = (exercisesStore.getCardioExercise(index: index))
      }
    case SelectedType.STRETCH:
      let numStretch = stretchKeys.count
      if (numStretch == 0) {
        selectedExercise = Exercise(name: "Nil", type: noneType)
      } else {
       selectedExercise = (exercisesStore.getStretchExercise(index: index))
      }
    case SelectedType.WEIGHT:
      let numWeight = weightKeys.count
      if (numWeight == 0) {
        selectedExercise = Exercise(name: "Nil", type: noneType)
      } else {
       selectedExercise = (exercisesStore.getWeightExercise(index: index))
      }
    default:
      break
    }
  }

  func reload() {
    pickerView.reloadAllComponents()
  }

}
