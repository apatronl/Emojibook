//
//  EmojiWidgetBundle.swift
//  Emojibook WidgetExtension
//
//  Created by Alejandrina Patrón López on 7/29/20.
//

import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    RandomEmojiWidget()
    CustomEmojiWidget()
  }
}
