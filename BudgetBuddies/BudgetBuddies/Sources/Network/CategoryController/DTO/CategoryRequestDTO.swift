//
//  CategoryRequestDTO.swift
//  BudgetBuddies
//
//  Created by Jiwoong CHOI on 8/5/24.
//

import Foundation

// MARK: - CategoryRequest

struct CategoryRequestDTO: Codable {
  let userID: Int
  let name: String
  let isDefault: Bool

  enum CodingKeys: String, CodingKey {
    case userID = "userId"
    case name, isDefault
  }
}