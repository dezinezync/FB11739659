//
//  AppIntents.swift
//  AppIntentsBug
//
//  Created by Nikhil Nigade on 10/11/22.
//

import Foundation
import AppIntents
import UIKit

struct FocusFilterIntent: SetFocusFilterIntent {
  static var title: LocalizedStringResource = "Visible Items"
  static var subtitle: LocalizedStringResource = "Select visible items when focus is active"
  
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(
      title: FocusFilterIntent.title,
      subtitle: FocusFilterIntent.subtitle
    )
  }
  
  // MARK: Params

  /// the UUID of the calendar set
  @Parameter(title: "Item", optionsProvider: ItemOptionsProvider())
  var focusItem: FocusItem?
  
  // MARK: Handlers
  @MainActor func perform() async throws -> some IntentResult {
    // send result to app 
    return .result()
  }
}

internal struct ItemOptionsProvider: DynamicOptionsProvider {
  typealias Result = Array<FocusItem>
  typealias DefaultValue = FocusItem?
  
  func results() async throws -> Result {
    previewItems
  }
  
  func `default`() async -> DefaultValue {
    nil
  }
}

