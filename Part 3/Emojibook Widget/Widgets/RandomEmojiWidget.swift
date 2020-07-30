//
//  RandomEmojiWidget.swift
//  Emojibook Widget
//
//  Created by Alejandrina Patrón López on 7/12/20.
//

import SwiftUI
import WidgetKit

struct RandomEmojiWidgetProvider: TimelineProvider {
 
  public func snapshot(with context: Context, completion: @escaping (RandomEmojiEntry) -> ()) {
    let entry = RandomEmojiEntry(date: Date(), emojiDetails: EmojiProvider.random())
    completion(entry)
  }

  public func timeline(
    with context: Context, 
    completion: @escaping (Timeline<RandomEmojiEntry>) -> ()
  ) {
    var entries: [RandomEmojiEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = RandomEmojiEntry(date: entryDate, emojiDetails: EmojiProvider.random())
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct RandomEmojiEntry: TimelineEntry {
  public let date: Date
  public let emojiDetails: EmojiDetails
}

struct RandomEmojiWidgetEntryView: View {
  var entry: RandomEmojiWidgetProvider.Entry

  var body: some View {
    EmojiWidgetView(emojiDetails: entry.emojiDetails)
  }
}

struct RandomEmojiWidget: Widget {
  private let kind: String = "RandomEmojiWidget"

  public var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: kind,
      provider: RandomEmojiWidgetProvider(),
      placeholder: EmojiWidgetPlaceholderView()
    ) { entry in
      RandomEmojiWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Random Emoji Widget")
    .description("Display a widget with an emoji that is updated randomly.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

struct Emojibook_Widget_Previews: PreviewProvider {
  static var previews: some View {
    RandomEmojiWidgetEntryView(
      entry: RandomEmojiEntry(
        date: Date(),
        emojiDetails: EmojiProvider.random()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
