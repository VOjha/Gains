//
//  ViewExerciseStatsViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 12/4/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit
import Charts

class ViewExerciseStatsViewController: UIViewController {

  @IBOutlet var textTitles: Array<UILabel>?

  @IBOutlet weak var exerciseNameLabel: UILabel!
  @IBOutlet weak var barChartView: BarChartView!

  var selectedExercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()

        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func setExercise(exercise: Exercise) {
    selectedExercise = exercise
  }

  func styleView() {
    // Titles
    styleLabels(labels: textTitles!, font: Fonts.selectTypeTitleFont!, textColor: Colors.themeRedColor)
    exerciseNameLabel.text = selectedExercise?.name

    switch selectedExercise?.type.name {
    case cardioType.name?:
      setUpCardioStats(exercise: selectedExercise as! CardioExercise)
    case stretchType.name?:
//      setUpStretchStats()
      return
    case weightType.name?:
//      setUpWeightStats()
      return
    default:
      return
    }
  }

  func setUpCardioStats(exercise: CardioExercise) {
    var dataEntries = [ChartDataEntry]()
    var dataLabels = [String]()

    var i = 0
    for (date, time) in exercise.times {
      let dataPoint = BarChartDataEntry(x: Double(i), y: time)
      dataEntries.append(dataPoint)

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd-MM"
      let dateString = dateFormatter.string(from: date)
      dataLabels.append(dateString)

      i += 1
    }

    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Times")

    let chartData = BarChartData(dataSets: [chartDataSet])

    barChartView.data = chartData
  }

}
