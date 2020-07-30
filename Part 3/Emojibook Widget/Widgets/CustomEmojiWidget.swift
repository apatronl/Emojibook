//
//  CustomEmojiWidget.swift
//  Emojibook WidgetExtension
//
//  Created by Alejandrina Patrón López on 7/29/20.
//

import SwiftUI
import WidgetKit

struct CustomEmojiWidgetProvider: IntentTimelineProvider {

  func snapshot(
    for configuration: SelectEmojiIntent,
    with context: Context,
    completion: @escaping (CustomEmojiEntry) -> ()
  ) {
    let entry =
      CustomEmojiEntry(
        date: Date(),
        widgetFamily: context.family,
        emojiDetails: EmojiProvider.random())
    completion(entry)
  }

  public func timeline(
    for configuration: SelectEmojiIntent,
    with context: Context,
    completion: @escaping (Timeline<CustomEmojiEntry>) -> ()
  ) {
    var entries = [CustomEmojiEntry]()
    if let emojiId = configuration.emoji?.identifier,
       let emojiDetails = lookupEmojiDetails(forId: emojiId) {
      let entry = CustomEmojiEntry(
        date: Date(),
        widgetFamily: context.family,
        emojiDetails: emojiDetails
      )
      entries.append(entry)
    }
    let timeline = Timeline(entries: entries, policy: .never)
    completion(timeline)
  }

  private func lookupEmojiDetails(forId id: String) -> EmojiDetails? {
    return EmojiProvider.all().first(where: { emojiDetails in
      emojiDetails.id == id
    })
  }
}

struct CustomEmojiEntry: TimelineEntry {
  public let date: Date
  public let widgetFamily: WidgetFamily
  public let emojiDetails: EmojiDetails
}

struct CustomEmojiWidgetEntryView : View {
  var entry: CustomEmojiWidgetProvider.Entry

  var body: some View {
    EmojiWidgetView(emojiDetails: entry.emojiDetails)
  }
}

struct CustomEmojiWidget: Widget {
  private let kind: String = "CustomEmojiWidget"

  public var body: some WidgetConfiguration {
    IntentConfiguration(
      kind: kind,
      intent: SelectEmojiIntent.self,
      provider: CustomEmojiWidgetProvider(),
      placeholder: EmojiWidgetPlaceholderView()
    ) { entry in
      CustomEmojiWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Custom Emoji Widget")
    .description("Display a widget with an emoji of your choice.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}
