//
//  CardioExerciseViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

class CardioExerciseViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textFields: Array<UITextField>?
  @IBOutlet var textLabelsAsFields: Array<UILabel>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textLabels: Array<UILabel>?
  @IBOutlet weak var datePicker: CustomDatePicker!
  @IBOutlet weak var scrollView: UIScrollView!

  @IBOutlet weak var exerciseNameField: UITextField!
  @IBOutlet weak var minutesField: UITextField!
  @IBOutlet weak var secondsField: UITextField!

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  override func viewDidLayoutSubviews() {
    scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: SizeConstants.newCardioScreenHeight)
  }

  func styleView() {
    setLocalizedTextForViews(textItems!)

    // Title
    styleLabels(labels: textTitles!, font: Fonts.exerciseTypeTitleFont!, textColor: Colors.themeRedColor)

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.textFieldLabelFont!, textColor: Colors.themeRedColor)

    // Text Fields
    styleTextFields(fields: textFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Labels styled as Text Fields
    styleLabels(labels: textLabelsAsFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickSave(_ sender: Any) {
    let name = exerciseNameField.text
    let newCardioExercise = CardioExercise(name: name!)

    let mins = Double(self.minutesField.text!) ?? 0
    let secs = Double(self.secondsField.text!) ?? 0

    newCardioExercise.addDataPoint(date: datePicker.selectedDate, minutes: mins, seconds: secs)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.exercises?.addExercise(exercise: newCardioExercise)

    saveCardioExercises()

    let landingVC = LandingPageViewController()
    self.navigationController?.pushViewController(landingVC, animated: true)
  }

  private func saveCardioExercises() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.cardioExercises)!, toFile: FilePaths.cardioURL.path)

    if isSuccessfulSave {
      os_log("Cardio Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Cardio Exercises... ", log: OSLog.default, type: .error)
    }
  }

  @IBAction func didTap(_ sender: Any) {
    for field in textFields! {
      field.resignFirstResponder()
    }
  }

}
