//
//  MonthlyBudgetInfoCollectionViewCell.swift
//  BudgetBuddies
//
//  Created by Jiwoong CHOI on 8/6/24.
//

import SnapKit
import UIKit

class MonthlyBudgetInfoCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties

  static let reuseIdentifier = "MonthlyBudgetInfo"

  // MARK: - UI Components

  // 정보 구분 배경색
  public let colorBackground: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 15
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    // Dummy Color Data
    view.backgroundColor = BudgetBuddiesAsset.AppColor.lemon3.color
    return view
  }()

  // "~정보" 배경
  public let infoCategoryBackground: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 8
    view.snp.makeConstraints { make in
      make.width.equalTo(50)
      make.height.equalTo(19)
    }

    // Dummy Color Data
    view.backgroundColor = BudgetBuddiesAsset.AppColor.lemon2.color
    return view
  }()

  // "~정보" 텍스트 레이블
  public let infoCategoryTextLabel: UILabel = {
    let label = UILabel()
    label.font = BudgetBuddiesFontFamily.Pretendard.medium.font(size: 12)

    // Dummy Text Data
    label.text = "할인정보"

    // Dummy Text Color Data
    label.textColor = BudgetBuddiesAsset.AppColor.orange2.color
    return label
  }()

  // 정보 텍스트 레이블
  public let titleTextLabel: UILabel = {
    let label = UILabel()
    label.font = BudgetBuddiesFontFamily.Pretendard.semiBold.font(size: 16)
    label.numberOfLines = 2

    // Dummy Text Data
    label.text = "지그재그\n썸머세일"
    return label
  }()

  // 정보 아이콘 이미지뷰
  public let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 12
    imageView.snp.makeConstraints { make in
      make.width.height.equalTo(36)
    }

    // Dummy Image Data
    imageView.image = BudgetBuddiesAsset.AppImage.MainViewImage.zigZagSampleIcon.image
    return imageView
  }()

  // 정보 날짜 텍스트 레이블
  public let dateTextLabel: UILabel = {
    let label = UILabel()
    label.font = BudgetBuddiesFontFamily.Pretendard.regular.font(size: 12)
    label.textColor = BudgetBuddiesAsset.AppColor.subGray.color
    label.text = "08.07 - 08.12"
    return label
  }()

  // MARK: - Intializer

  override init(frame: CGRect) {
    super.init(frame: frame)

    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  private func setLayout() {
    self.snp.makeConstraints { make in
      make.width.equalTo(127)
      make.height.equalTo(162)
    }

    layer.cornerRadius = 15
    backgroundColor = BudgetBuddiesAsset.AppColor.white.color

    // Add Subviews
    addSubviews(
      colorBackground,
      infoCategoryBackground,
      titleTextLabel,
      iconImageView,
      dateTextLabel
    )

    infoCategoryBackground.addSubview(infoCategoryTextLabel)

    // Make UI Components Contraints
    // 정보 구분 배경색
    colorBackground.snp.makeConstraints { make in
      make.height.equalTo(47)
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }

    // "~정보" 배경
    titleTextLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(12)
      make.top.equalToSuperview().inset(62)
    }

    // "~정보" 배경
    infoCategoryBackground.snp.makeConstraints { make in
      make.leading.top.equalToSuperview().inset(8)
    }

    // "~정보" 텍스트 레이블
    infoCategoryTextLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }

    // 정보 아이콘 이미지뷰
    iconImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(28)
      make.trailing.equalToSuperview().inset(8)
    }

    // 정보 날짜 텍스트 레이블
    dateTextLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(12)
      make.top.equalToSuperview().inset(129)
    }
  }
}