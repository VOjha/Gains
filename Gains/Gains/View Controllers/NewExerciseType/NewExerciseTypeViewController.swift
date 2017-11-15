//
//  NewExerciseTypeViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class NewExerciseTypeViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textLabels: Array<UILabel>?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func styleView() {
    setLocalizedTextForViews(self.textItems!)

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.selectTypeTitleFont!, textColor: Colors.themeRedColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.selectTypeLabelFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickCardio(_ sender: Any) {
    let newCardioVC = CardioExerciseViewController()
    self.navigationController?.pushViewController(newCardioVC, animated: true)
  }

  @IBAction func didClickStretch(_ sender: Any) {
  }

  @IBAction func didClickWeight(_ sender: Any) {
    let newWeightVC = WeightExerciseViewController()
    self.navigationController?.pushViewController(newWeightVC, animated: true)
  }

}
