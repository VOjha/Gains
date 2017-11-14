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
  @IBOutlet weak var cardioButton: UIButton!
  @IBOutlet weak var stretchButton: UIButton!
  @IBOutlet weak var weightButton: UIButton!
  @IBOutlet weak var selectTypeLabel: UILabel!
  
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

    // Label
    selectTypeLabel.font = UIFont(name: "Rubik-Bold", size: 25)
    selectTypeLabel.textColor = Colors.themeRedColor

    // Buttons
    cardioButton.titleLabel!.font = UIFont(name: "Rubik-Regular", size: 30)
    stretchButton.titleLabel!.font = UIFont(name: "Rubik-Regular", size: 30)
    weightButton.titleLabel!.font = UIFont(name: "Rubik-Regular", size: 30)
  }

  @IBAction func didClickCardio(_ sender: Any) {
    let newCardioVC = CardioExerciseViewController()
    self.navigationController?.pushViewController(newCardioVC, animated: true)
  }

  @IBAction func didClickStretch(_ sender: Any) {
  }

  @IBAction func didClickWeight(_ sender: Any) {
  }

}
