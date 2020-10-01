//
//  CustomEmojiWidget.swift
//  Emojibook WidgetExtension
//
//  Created by Alejandrina Patrón López on 7/29/20.
//

import SwiftUI
import WidgetKit

struct CustomEmojiWidgetProvider: IntentTimelineProvider {
  typealias Entry = CustomEmojiEntry
  typealias Intent = SelectEmojiIntent

  func placeholder(in context: Context) -> CustomEmojiEntry {
    CustomEmojiEntry(date: Date(), emojiDetails: EmojiProvider.random())
  }
  
  func getSnapshot(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (CustomEmojiEntry) -> Void) {
    // Use a random emoji in the widget gallery.
    if context.isPreview {
      completion(CustomEmojiEntry(date: Date(), emojiDetails: EmojiProvider.random()))
      return
    }

    let emojiDetails = lookupEmojiDetails(for: configuration)
    let entry = CustomEmojiEntry(date: Date(), emojiDetails: emojiDetails)
    completion(entry)
  }
  
  func getTimeline(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (Timeline<CustomEmojiEntry>) -> Void) {
    var entries = [CustomEmojiEntry]()
    let emojiDetails = lookupEmojiDetails(for: configuration)
    let entry = CustomEmojiEntry(date: Date(), emojiDetails: emojiDetails)
    entries.append(entry)
    let timeline = Timeline(entries: entries, policy: .never)
    completion(timeline)
  }

  private func lookupEmojiDetails(for configuration: SelectEmojiIntent) -> EmojiDetails {
    guard let emojiId = configuration.emoji?.identifier,
       let emojiForConfig = EmojiProvider.all().first(where: { emoji in
        emoji.id == emojiId
       })
    else {
      return EmojiProvider.random()
    }
    return emojiForConfig
  }
}

struct CustomEmojiEntry: TimelineEntry {
  public let date: Date
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
      provider: CustomEmojiWidgetProvider()
    ) { entry in
      CustomEmojiWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Custom Emoji Widget")
    .description("Display a widget with an emoji of your choice.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}
