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
  public let url: URL?

  init(emoji: String, name: String, description: String) {
    self.emoji = emoji
    self.name = name
    self.description = description
    self.url = URL(string: "emoji://\(name.filter { !$0.isWhitespace } )")
  }
}

// MARK: - Identifiable

extension EmojiDetails: Identifiable {
  public var id: String {
    emoji
  }
}
