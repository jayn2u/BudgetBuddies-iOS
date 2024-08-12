//
//  ConsumedAnalysisFirstItem.swift
//  BudgetBuddies
//
//  Created by Jiwoong CHOI on 8/9/24.
//

import SnapKit
import UIKit

class MonthlyConsumedAnalysisFirstItem: UIView {

  // MARK: - UI Componenets

  private let textLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.text = "혜인님 또래는\n패션에 가장 큰 목표를 세웠어요"
    label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 16)
    label.setLineSpacing(lineSpacing: 10)
    return label
  }()

  private let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = BudgetBuddiesAsset.AppImage.MainViewImage.graphIcon.image
    return imageView
  }()

  // MARK: - Initializer

  override init(frame: CGRect) {
    super.init(frame: frame)

    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  private func setLayout() {
    backgroundColor = BudgetBuddiesAsset.AppColor.white.color
    layer.cornerRadius = 15

    self.snp.makeConstraints { make in
      make.height.equalTo(88)
    }

    addSubviews(
      textLabel,
      iconImageView)

    textLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(20)
      make.centerY.equalToSuperview()
    }

    iconImageView.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(31)
      make.centerY.equalToSuperview()
    }
  }

}