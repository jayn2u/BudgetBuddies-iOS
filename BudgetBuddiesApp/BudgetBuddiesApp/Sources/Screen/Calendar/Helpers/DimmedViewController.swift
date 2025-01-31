//
//  DimmedViewController.swift
//  BudgetBuddies
//
//  Created by 김승원 on 7/27/24.
//

import SnapKit
import UIKit

class DimmedViewController: UIViewController {
  // MARK: - UI Components
  private var dimmedView = UIView()

  // MARK: - init
  init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .overFullScreen
    modalTransitionStyle = .coverVertical
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Life Cycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    guard let presentingViewController = presentingViewController else { return }
      dimmedView.backgroundColor = BudgetBuddiesAppAsset.AppColor.textBlack.color
    dimmedView.alpha = 0

    presentingViewController.view.addSubview(dimmedView)

    dimmedView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    UIView.animate(withDuration: 0.3) {
      self.dimmedView.alpha = 0.5
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    UIView.animate(withDuration: 0.3) {
      self.dimmedView.alpha = 0
    } completion: { _ in
      self.dimmedView.removeFromSuperview()
    }
  }
}
