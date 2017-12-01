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

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

  override init(frame: CGRect) {
    selectedExercise = Exercise(name: "Nil", type: cardioType)
    selectedType = SelectedType.NONE

    cardioKeys = []
    stretchKeys = []
    weightKeys = []

    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    selectedExercise = Exercise(name: "Nil", type: cardioType)
    selectedType = SelectedType.NONE

    cardioKeys = []
    stretchKeys = []
    weightKeys = []

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
      title = "No Type Selected"
    }

    label?.text = title
    return label!
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let exercisesStore = appDelegate.exercises

    switch selectedType {
    case SelectedType.CARDIO:
      let numCardio = cardioKeys.count
      if (numCardio == 0) { break }
      selectedExercise = (exercisesStore?.getCardioExercise(index: row))!
    case SelectedType.STRETCH:
      let numStretch = stretchKeys.count
      if (numStretch == 0) { break }
      selectedExercise = (exercisesStore?.getStretchExercise(index: row))!
    case SelectedType.WEIGHT:
      let numWeight = weightKeys.count
      if (numWeight == 0) { break }
      selectedExercise = (exercisesStore?.getWeightExercise(index: row))!
    default:
      break
    }
  }

  func reload() {
    pickerView.reloadAllComponents()
  }

}
