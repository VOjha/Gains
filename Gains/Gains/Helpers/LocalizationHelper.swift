//
//  LocalizationHelper.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

func setLocalizedTextForViews(_ views: [UIView]) {
  for view in views {
    if view is UILabel {
      let label = view as! UILabel
      let key = label.text
      label.text = NSLocalizedString(key!, comment: "")
    }
    else if view is UITextView {
      let textView = view as! UITextView
      let key = textView.text
      textView.text = NSLocalizedString(key!, comment: "")
    }
    else if view is UIButton {
      let button = view as! UIButton
      let key = button.titleLabel!.text
      button.setTitle(NSLocalizedString(key!, comment: ""), for: .normal)
    }
    // Text field: localize text if there is any, if not, localize placeholder
    else if view is UITextField {
      let textField = view as! UITextField
      if textField.text!.count > 0 {
        let key = textField.text
        textField.text = NSLocalizedString(key!, comment: "")
      }
      else if textField.placeholder!.count > 0 {
        let key = textField.placeholder
        textField.placeholder = NSLocalizedString(key!, comment: "")
      }
    }
  }
}
