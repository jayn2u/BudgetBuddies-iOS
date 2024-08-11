//
//  GoalChartView.swift
//  BudgetBuddies
//
//  Created by 이승진 on 7/24/24.
//

import DGCharts
import SnapKit
import UIKit

final class GoalChartView: UIView {
  let planLabel: UILabel = {
    let label = UILabel()
    label.text = "패션에 가장 큰 \n계획을 세웠어요"
    label.font = .systemFont(ofSize: 22, weight: .semibold)
    label.numberOfLines = 0
    return label
  }()

  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "24년 8월 (8/25 11:30)"
    label.textColor = .gray
    label.font = .systemFont(ofSize: 12, weight: .regular)
    return label
  }()

  let pieChartView = PieChartView()

  let firstLabel = {
    let label = UILabel()
    label.text = "패션"
    label.textColor = BudgetBuddiesAsset.AppColor.textBlack.color
    label.textAlignment = .center
    label.font = BudgetBuddiesFontFamily.Pretendard.semiBold.font(size: 18)
    return label
  }()

  let firstPrice = {
    let label = UILabel()
    label.text = "120,000원"
    label.textColor = BudgetBuddiesAsset.AppColor.subGray.color
    label.textAlignment = .center
    label.font = BudgetBuddiesFontFamily.Pretendard.regular.font(size: 14)
    return label
  }()

  let legendStackView: UIStackView = {
    let sv = UIStackView()
    sv.axis = .vertical
    sv.spacing = 36
    return sv
  }()

  let stackView: UIStackView = {
    let sv = UIStackView()
    sv.axis = .vertical
    sv.spacing = 36
    sv.distribution = .fillEqually
    return sv
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setConst()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  private func setup() {
    [planLabel, dateLabel, pieChartView, firstLabel, firstPrice, legendStackView, stackView].forEach
    {
      self.addSubview($0)
    }
  }

  private func setConst() {
    planLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
    }

    dateLabel.snp.makeConstraints {
      $0.top.equalTo(planLabel.snp.bottom).offset(8)
      $0.leading.equalToSuperview().offset(20)
    }

    pieChartView.snp.makeConstraints {
      $0.top.equalTo(dateLabel.snp.bottom).offset(30)
      $0.leading.equalToSuperview().offset(20)
      $0.width.equalTo(200)
      $0.height.equalTo(pieChartView.snp.width)
    }

    firstLabel.snp.makeConstraints {
      $0.centerX.equalTo(pieChartView)
      $0.centerY.equalTo(pieChartView).offset(-10)
    }

    firstPrice.snp.makeConstraints {
      $0.top.equalTo(firstLabel.snp.bottom).offset(4)
      $0.centerX.equalTo(firstLabel)
    }

    legendStackView.snp.makeConstraints {
      $0.centerY.equalTo(pieChartView)
      $0.leading.equalTo(pieChartView.snp.trailing).offset(30)
      $0.trailing.equalToSuperview()
    }

    stackView.snp.makeConstraints {
      $0.top.equalTo(pieChartView.snp.bottom).offset(40)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.bottom.equalToSuperview().offset(-30)
    }
  }

  func setupChart(entries: [PieChartDataEntry]) {
    let dataSet = PieChartDataSet(entries: entries, label: "소비습관")
    dataSet.colors = [
      UIColor.systemBlue, UIColor.systemYellow, UIColor.systemOrange, UIColor.systemCyan,
    ]
    dataSet.drawValuesEnabled = false
    dataSet.sliceSpace = 2
    dataSet.selectionShift = 5

    let data = PieChartData(dataSet: dataSet)
    pieChartView.data = data

    pieChartView.usePercentValuesEnabled = false
    pieChartView.drawHoleEnabled = true
    pieChartView.holeRadiusPercent = 0.75
    pieChartView.transparentCircleRadiusPercent = 0.76
    pieChartView.chartDescription.enabled = false
    pieChartView.legend.enabled = false
    pieChartView.notifyDataSetChanged()
    pieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
  }

  func setChartData(data: [(rank: String, category: String, value: Int, color: UIColor)]) {
    stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    legendStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

    for item in data {
      let itemView = createChartItemView(
        rank: item.rank, category: item.category, value: item.value, color: item.color)
      stackView.addArrangedSubview(itemView)

      let legendItemView = createLegendItemView(category: item.category, color: item.color)
      legendStackView.addArrangedSubview(legendItemView)
    }
  }

  private func createChartItemView(rank: String, category: String, value: Int, color: UIColor)
    -> UIView
  {
    let containerView = UIView()

    let rankLabel: UILabel = {
      let label = UILabel()
      label.text = rank
      label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 14)
      label.textColor = BudgetBuddiesAsset.AppColor.logoLine2.color
      label.backgroundColor = BudgetBuddiesAsset.AppColor.face.color
      label.textAlignment = .center
      label.layer.cornerRadius = 4
      label.layer.borderWidth = 1
      label.layer.borderColor = BudgetBuddiesAsset.AppColor.calendarYellow.color.cgColor
      label.clipsToBounds = true
      return label
    }()

    let categoryLabel: UILabel = {
      let label = UILabel()
      label.text = category
      label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 14)
      label.textColor = BudgetBuddiesAsset.AppColor.textBlack.color
      return label
    }()

    let valueLabel: UILabel = {
      let label = UILabel()
      label.text = "\(value)원"
      label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 14)
      label.textColor = BudgetBuddiesAsset.AppColor.subGray.color
      return label
    }()

    [rankLabel, categoryLabel, valueLabel].forEach {
      containerView.addSubview($0)
    }

    rankLabel.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.width.equalTo(32)
    }

    categoryLabel.snp.makeConstraints {
      $0.leading.equalTo(rankLabel.snp.trailing).offset(8)
      $0.centerY.equalToSuperview()
    }

    valueLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalToSuperview()
    }

    return containerView
  }

  private func createLegendItemView(category: String, color: UIColor) -> UIView {
    let containerView = UIView()

    let colorView: UIView = {
      let view = UIView()
      view.backgroundColor = color
      view.layer.cornerRadius = 4
      view.snp.makeConstraints { $0.size.equalTo(CGSize(width: 16, height: 16)) }
      return view
    }()

    let categoryLabel: UILabel = {
      let label = UILabel()
      label.text = category
      label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 14)
      label.textColor = BudgetBuddiesAsset.AppColor.textBlack.color
      return label
    }()

    [colorView, categoryLabel].forEach {
      containerView.addSubview($0)
    }

    colorView.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.centerY.equalToSuperview()
    }

    categoryLabel.snp.makeConstraints {
      $0.leading.equalTo(colorView.snp.trailing).offset(8)
      $0.centerY.equalToSuperview()
    }

    return containerView
  }
}