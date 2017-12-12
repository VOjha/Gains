//
//  EnterDataViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/27/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

enum SelectedType {
  case NONE, CARDIO, STRETCH, WEIGHT
}

class EnterDataViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var typeButtons: Array<UIButton>?
  @IBOutlet var saveButton: Array<UIButton>?
  @IBOutlet var textFields: Array<UITextField>?
  @IBOutlet var textLabelsAsFields: Array<UILabel>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textLabels: Array<UILabel>?

  @IBOutlet weak var dataEntryView: UIView!
  @IBOutlet weak var cardioButton: UIButton!
  @IBOutlet weak var stretchButton: UIButton!
  @IBOutlet weak var weightButton: UIButton!

  @IBOutlet weak var exercisePicker: ExercisePicker!
  @IBOutlet weak var datePicker: CustomDatePicker!

  @IBOutlet weak var weightViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var durationViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var setsAndRepsViewHeightConstraint: NSLayoutConstraint!

  @IBOutlet weak var weightView: UIView!
  @IBOutlet weak var durationView: UIView!
  @IBOutlet weak var setsAndRepsView: UIView!

  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var minutesTextField: UITextField!
  @IBOutlet weak var secondsTextField: UITextField!
  @IBOutlet weak var setsTextField: UITextField!
  @IBOutlet weak var repsTextField: UITextField!

  var selectedType: SelectedType?

  let inputViewHeight = CGFloat(82.0)
  let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        dataEntryView.isHidden = true
        selectedType = SelectedType.NONE

        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func styleView() {
    setLocalizedTextForViews(textItems!)

    // Title
    styleLabels(labels: textTitles!, font: Fonts.enterDataTitleFont!, textColor: Colors.themeRedColor)

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.textFieldLabelFont!, textColor: Colors.themeRedColor)

    // Text Fields
    styleTextFields(fields: textFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Labels styled as Text Fields
    styleLabels(labels: textLabelsAsFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Buttons
    styleButtons(buttons: typeButtons!, font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: saveButton!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickCardio(_ sender: Any) {
    styleButtons(buttons: [cardioButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [stretchButton, weightButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColor)
    selectedType = SelectedType.CARDIO

    loadDataEntryView()
  }

  @IBAction func didClickStretch(_ sender: Any) {
    styleButtons(buttons: [stretchButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [cardioButton, weightButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColor)
    selectedType = SelectedType.STRETCH

    loadDataEntryView()
  }

  @IBAction func didClickWeight(_ sender: Any) {
    styleButtons(buttons: [weightButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [stretchButton, cardioButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColor)
    selectedType = SelectedType.WEIGHT

    loadDataEntryView()
  }

  func loadDataEntryView() {
    exercisePicker.setSelectedType(selectType: selectedType!)
    exercisePicker.pickExerciseAtIndex(index: 0)
    exercisePicker.reload()

    setUpDataEntryForSelectedType()
    dataEntryView.isHidden = false
  }

  func setUpDataEntryForSelectedType() {
    switch selectedType! {
    case SelectedType.CARDIO:
      weightViewHeightConstraint.constant = 0
      weightView.isHidden = true

      durationViewHeightConstraint.constant = inputViewHeight
      durationView.isHidden = false

      setsAndRepsViewHeightConstraint.constant = 0
      setsAndRepsView.isHidden = true
    case SelectedType.STRETCH:
      weightViewHeightConstraint.constant = 0
      weightView.isHidden = true

      durationViewHeightConstraint.constant = 0
      durationView.isHidden = true

      setsAndRepsViewHeightConstraint.constant = inputViewHeight
      setsAndRepsView.isHidden = false
    case SelectedType.WEIGHT:
      weightViewHeightConstraint.constant = inputViewHeight
      weightView.isHidden = false

      durationViewHeightConstraint.constant = 0
      durationView.isHidden = true

      setsAndRepsViewHeightConstraint.constant = inputViewHeight
      setsAndRepsView.isHidden = false
    default:
      break
    }
  }

  @IBAction func didClickSave(_ sender: Any) {
    let exercise = exercisePicker.selectedExercise

    switch exercise.type.name {
    case noneType.name:
      let alertController = UIAlertController(title: "Error", message: "Must select an exercise to save data!", preferredStyle: .alert)
      let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
      alertController.addAction(defaultAction)
      present(alertController, animated: true, completion: nil)
    case cardioType.name:
      saveCardioExercise()
    case stretchType.name:
      saveStretchExercise()
    case weightType.name:
      saveWeightExercise()
    default:
      return
    }

    let landingVC = LandingPageViewController()
    navigationController?.pushViewController(landingVC, animated: true)
  }

  func saveCardioExercise() {
    let cardioEx = exercisePicker.selectedExercise as! CardioExercise

    let mins = Double(self.minutesTextField.text!) ?? 0
    let secs = Double(self.secondsTextField.text!) ?? 0

    cardioEx.addDataPoint(date: datePicker.selectedDate, minutes: mins, seconds: secs)

    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.cardioExercises)!, toFile: FilePaths.cardioURL.path)

    if isSuccessfulSave {
      os_log("Cardio Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Cardio Exercises... ", log: OSLog.default, type: .error)
    }
  }

  func saveStretchExercise() {
    let stretchEx = exercisePicker.selectedExercise as! StretchExercise

    let sets = Double(self.setsTextField.text!) ?? 0
    let reps = Double(self.repsTextField.text!) ?? 0

    stretchEx.addDataPoint(date: datePicker.selectedDate, sets: sets, reps: reps)

    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.stretchExercises)!, toFile: FilePaths.stretchURL.path)

    if isSuccessfulSave {
      os_log("Stretch Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Stretch Exercises... ", log: OSLog.default, type: .error)
    }
  }

  func saveWeightExercise() {
    let weightEx = exercisePicker.selectedExercise as! WeightExercise

    let sets = Double(self.setsTextField.text!) ?? 0
    let reps = Double(self.repsTextField.text!) ?? 0
    let weight = Double(self.weightTextField.text!) ?? 0

    weightEx.addDataPoint(date: datePicker.selectedDate, weight: weight, sets: sets, reps: reps)

    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.weightExercises)!, toFile: FilePaths.weightsURL.path)

    if isSuccessfulSave {
      os_log("Weight Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Weight Exercises... ", log: OSLog.default, type: .error)
    }
  }

  @IBAction func didTap(_ sender: Any) {
    for field in textFields! {
      field.resignFirstResponder()
    }
  }

}
