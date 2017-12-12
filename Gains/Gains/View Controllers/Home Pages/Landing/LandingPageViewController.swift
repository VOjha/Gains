//
//  LandingPageViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

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
    styleLabels(labels: textLabels!, font: Fonts.landingPageTitleFont!, textColor: Colors.themeRedColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickViewStats(_ sender: Any) {
    let viewStatsVC = ViewStatsViewController()
    self.navigationController?.pushViewController(viewStatsVC, animated: true)
  }

  @IBAction func didClickNewExercise(_ sender: Any) {
    let newExerciseVC = NewExerciseTypeViewController()
    self.navigationController?.pushViewController(newExerciseVC, animated: true)
  }

  @IBAction func didClickEnterData(_ sender: Any) {
    let enterDataVC = EnterDataViewController()
    self.navigationController?.pushViewController(enterDataVC, animated: true)
  }

}
