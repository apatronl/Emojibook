//
//  EmojiWidgetView.swift
//  Emojibook WidgetExtension
//
//  Created by Alejandrina Patrón López on 7/12/20.
//

import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {

  let emojiDetails: EmojiDetails

  var body: some View {
    ZStack {
      Color(UIColor.systemIndigo)
      VStack {
        Text(emojiDetails.emoji)
          .font(.system(size: 56))
        Text(emojiDetails.name)
          .font(.headline)
          .multilineTextAlignment(.center)
          .padding(.top, 5)
          .padding([.leading, .trailing])
          .foregroundColor(.white)
      }
    }
  }
}

struct EmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiWidgetView(emojiDetails: EmojiProvider.random())
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
