//
//  FocusItem.swift
//  AppIntentsBug
//
//  Created by Nikhil Nigade on 10/11/22.
//

import Foundation
import AppIntents

struct FocusItem: Identifiable, Hashable, Equatable, Codable, @unchecked Sendable {
  let id: String
  let title: String
}

@available(iOS 16.0, *)
extension FocusItem: AppEntity {
  static var typeDisplayRepresentation: TypeDisplayRepresentation {
    TypeDisplayRepresentation(stringLiteral: "FocusItem")
  }
  
  static var typeDisplayName: LocalizedStringResource = "FocusItem"
  
  static var defaultQuery = FocusItemQuery()

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(
      title: "\(title)"
    )
  }
}

@available(iOS 16.0, *)
struct FocusItemQuery: EntityQuery {
  typealias Entity = FocusItem

  func entities(for identifiers: [String]) async throws -> [Entity] {
    return previewItems.filter({ identifiers.contains($0.id) })
  }
}

let previewItems: [FocusItem] = [
  .init(id: "1", title: "One"),
  .init(id: "2", title: "Two"),
  .init(id: "3", title: "Three"),
  .init(id: "4", title: "Four"),
  .init(id: "5", title: "Five"),
  .init(id: "6", title: "Six"),
  .init(id: "7", title: "Seven")
]
