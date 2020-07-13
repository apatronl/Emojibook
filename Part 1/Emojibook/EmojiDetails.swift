//
//  EmojiDetails.swift
//  Emojibook
//
//  Created by Alejandrina Patrón López on 7/12/20.
//

import Foundation

public struct EmojiDetails {
  public let emoji: String
  public let name: String
  public let description: String
}

// MARK: - Identifiable

extension EmojiDetails: Identifiable {
  public var id: String {
    emoji
  }
}
