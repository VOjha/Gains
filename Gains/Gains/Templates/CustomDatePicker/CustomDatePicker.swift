//
//  CustomDatePicker.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class CustomDatePicker: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var pickerView: UIPickerView!

  var selectedDate: Date

  var selectedYear, selectedMonth, selectedDay: NSInteger

  override init(frame: CGRect) {
    self.selectedYear = 0
    self.selectedMonth = 0
    self.selectedDay = 0

    self.selectedDate = Date()

    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    self.selectedYear = 0
    self.selectedMonth = 0
    self.selectedDay = 0

    self.selectedDate = Date()

    super.init(coder: aDecoder)
    commonInit()
  }

  private func commonInit() {
    Bundle.main.loadNibNamed("CustomDatePicker", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    pickerView.delegate = self
    pickerView.dataSource = self

    let components = getDateComponents()
    let currentDay = components.day!
    let currentMonth = components.month!
    let currentYear = components.year!

    pickerView.reloadAllComponents()
    pickerView.selectRow((currentYear - DatePickerDefaults.defaultMinYear), inComponent: 0, animated: false)
    pickerView.selectRow((currentMonth - 1), inComponent: 1, animated: false)
    pickerView.selectRow((currentDay - 1), inComponent: 2, animated: false)

    self.selectedDay = currentDay
    self.selectedMonth = currentMonth
    self.selectedYear = currentYear
  }

  func getDateComponents() -> DateComponents {
    let currentDate = Date()
    let calendar = Calendar.current

    return calendar.dateComponents([.year, .month, .day], from: currentDate)
  }

  // UIPickerViewDataSource

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0: // Year
      return (DatePickerDefaults.defaultMaxYear - DatePickerDefaults.defaultMinYear) + 1
    case 1: // Month
      return 12
    case 2: // Day
      return 31
    default:
      return 0
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
    switch component {
    case 0: // Year
      title = String(row + DatePickerDefaults.defaultMinYear)
    case 1: // Month
      title = getMonthForInt(num: row)
    case 2: // Day
      title = String(row + 1)
    default:
      break
    }

    label?.text = title
    return label!
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch component {
    case 0:
      pickerView.reloadComponent(1)
      pickerView.reloadComponent(2)
    case 1:
      pickerView.reloadComponent(2)
    default:
      break
    }

    self.selectedYear = pickerView.selectedRow(inComponent: 0) + DatePickerDefaults.defaultMinYear
    self.selectedMonth = pickerView.selectedRow(inComponent: 1) + 1
    self.selectedDay = pickerView.selectedRow(inComponent: 2) + 1

    var components = DateComponents()
    components.year = self.selectedYear
    components.month = self.selectedMonth
    components.day = self.selectedDay

    self.selectedDate = (NSCalendar(calendarIdentifier: .gregorian)?.date(from: components))!
  }

  func getMonthForInt(num: Int) -> String {
    let fmt = DateFormatter()
    fmt.dateFormat = "MM"
    return fmt.monthSymbols[num]
  }

}
