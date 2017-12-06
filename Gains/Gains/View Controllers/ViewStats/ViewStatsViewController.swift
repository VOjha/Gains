//
//  ViewStatsViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 12/1/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit
import os.log

class ViewStatsViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var typeButtons: Array<UIButton>?
  @IBOutlet var selectButton: Array<UIButton>?

  @IBOutlet weak var cardioButton: UIButton!
  @IBOutlet weak var stretchButton: UIButton!
  @IBOutlet weak var weightButton: UIButton!
  @IBOutlet weak var exercisePicker: ExercisePicker!

  var selectedType: SelectedType?

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

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

    // Buttons
    styleButtons(buttons: typeButtons!, font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: selectButton!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickCardio(_ sender: Any) {
    styleButtons(buttons: [cardioButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [stretchButton, weightButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColorFaded)
    selectedType = SelectedType.CARDIO

    loadExercisePicker()
  }

  @IBAction func didClickStretch(_ sender: Any) {
    styleButtons(buttons: [stretchButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [cardioButton, weightButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColorFaded)
    selectedType = SelectedType.STRETCH

    loadExercisePicker()
  }

  @IBAction func didClickWeight(_ sender: Any) {
    styleButtons(buttons: [weightButton], font: Fonts.selectedTypeFont!, textColor: Colors.themeBlueColor)
    styleButtons(buttons: [stretchButton, cardioButton], font: Fonts.enterDataTypeFont!, textColor: Colors.themeBlueColorFaded)
    selectedType = SelectedType.WEIGHT

    loadExercisePicker()
  }

  func loadExercisePicker() {
    exercisePicker.setSelectedType(selectType: selectedType!)
    exercisePicker.pickExerciseAtIndex(index: 0)
    exercisePicker.reload()
  }

  @IBAction func didClickSelect(_ sender: Any) {
    let viewExerciseVC = ViewExerciseStatsViewController()
    viewExerciseVC.setExercise(exercise: exercisePicker.selectedExercise)
    navigationController?.pushViewController(viewExerciseVC, animated: true)
  }

  @IBAction func didClickClear(_ sender: Any) {
    appDelegate.exercises?.clearExercises()

    let isSuccessfulSaveCardio = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.cardioExercises)!, toFile: FilePaths.cardioURL.path)
    if isSuccessfulSaveCardio {
      os_log("Cardio Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Cardio Exercises... ", log: OSLog.default, type: .error)
    }

    let isSuccessfulSaveStretch = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.stretchExercises)!, toFile: FilePaths.stretchURL.path)
    if isSuccessfulSaveStretch {
      os_log("Stretch Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Stretch Exercises... ", log: OSLog.default, type: .error)
    }

    let isSuccessfulSaveWeight = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.weightExercises)!, toFile: FilePaths.weightsURL.path)
    if isSuccessfulSaveWeight {
      os_log("Weight Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Weight Exercises... ", log: OSLog.default, type: .error)
    }

    navigationController?.popViewController(animated: true)
  }

}
