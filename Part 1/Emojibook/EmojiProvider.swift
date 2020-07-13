//
//  EmojiProvider.swift
//  Emojibook
//
//  Created by Alejandrina Patrón López on 7/12/20.
//

import Foundation

public struct EmojiProvider {

  /// Creates a list of emoji details that includes an emoji along with its name and description.
  /// - Returns: The list of `EmojiDetail`s
  /// - Note: Emoji descriptions obtained from [Empojipedia](https://emojipedia.org/).
  static func all() -> [EmojiDetails] {
    return [
      EmojiDetails(
        emoji: "👾",
        name: "Alien Monster",
        description: "A friendly-looking, tentacled space creature with two eyes."),
      EmojiDetails(
        emoji: "🎨",
        name: "Artist Palette",
        description: "A palette used by an artist when painting, to store and mix paint colors."),
      EmojiDetails(
        emoji: "🥑",
        name: "Avocado",
        description: "A pear-shaped avocado, sliced in half to show its yellow-green flesh and "
          + "large brown pit."),
      EmojiDetails(
        emoji: "🤯",
        name: "Exploding Head",
        description: "A yellow face with an open mouth, the top of its head exploding in the shape "
          + "of a brain-like mushroom cloud."),
      EmojiDetails(
        emoji: "😀",
        name: "Grinning Face",
        description: "A yellow face with simple, open eyes and a broad, open smile, showing upper "
          + "teeth and tongue on some platforms."),
      EmojiDetails(
        emoji: "🍟",
        name: "French Fries",
        description: "Thin-cut, golden-brown French fries, served in a red carton, as at "
          + "McDonald’s."),
      EmojiDetails(
        emoji: "🐣",
        name: "Hatching Chick",
        description: "A baby chicken (chick), hatching from an egg and seeing the world for the "
          + "first time."),
      EmojiDetails(
        emoji: "🌭",
        name: "Hot Dog",
        description: "The cooked sausage of a hot dog in a sliced bun and drizzled with yellow "
          + "mustard, as eaten at a baseball game. "),
      EmojiDetails(
        emoji: "🏓",
        name: "Ping Pong",
        description: "A paddle and ping pong ball used in the sport of table tennis."),
      EmojiDetails(
        emoji: "🍕",
        name: "Pizza",
        description: "A slice of pepperoni pizza, topped with black olives on Google. WhatsApp "
          + "adds green pepper, Samsung white onion."),
      EmojiDetails(
        emoji: "🧩",
        name: "Puzzle Piece",
        description: "Puzzle Piece was approved as part of Unicode 11.0 in 2018 under the name "
          + "“Jigsaw Puzzle Piece” and added to Emoji 11.0 in 2018."),
      EmojiDetails(
        emoji: "🚀",
        name: "Rocket",
        description: "A rocket being propelled into space."),
      EmojiDetails(
        emoji: "📌",
        name: "Round Pushpin",
        description: "A thumbtack (drawing pin), as used to pin documents on a bulletin (notice) "
          + "board. Depicted at a 45° angle with its red, flat head to the upper right."),
      EmojiDetails(
        emoji: "🥰",
        name: "Smiling Face with Hearts",
        description: "A yellow face with smiling eyes, a closed smile, rosy cheeks, and several "
          + "hearts floating around its head."),
      EmojiDetails(
        emoji: "😈",
        name: "Smiling Face with Horns",
        description: "A face, usually purple, with devil horns, a wide grin, and eyes and eyebrows "
          + "scrunched downward on most platforms."),
      EmojiDetails(
        emoji: "🤩",
        name: "Star-Struck",
        description: "A yellow face with a broad, open smile, showing upper teeth on most "
          + "platforms, with stars for eyes, as if seeing a beloved celebrity."),
      EmojiDetails(
        emoji: "🗽",
        name: "Statue of Liberty",
        description: "The Statue of Liberty, often used as a depiction of New York City."),
      EmojiDetails(
        emoji: "🌻",
        name: "Sunflower",
        description: "A sunflower, a tall, round flower with large yellow petals. Depicted as a "
          + "single, vertical sunflower with a large, dark-brown center on a green stem."),
      EmojiDetails(
        emoji: "🧸",
        name: "Teddy Bear",
        description: "A classic teddy bear, as snuggled by a child when going to sleep."),
      EmojiDetails(
        emoji: "🎾",
        name: "Tennis",
        description: "A tennis racket (racquet) with a tennis ball. Only a ball is shown on Apple, "
          + "LG, Twitter, Facebook, and Mozilla platforms."),
      EmojiDetails(
        emoji: "🗼",
        name: "Tokyo Tower",
        description: "The Tokyo Tower is the second-tallest building in Japan, located in Minato, "
          + "Tokyo."),
      EmojiDetails(
        emoji: "🦄",
        name: "Unicorn",
        description: "The face of a unicorn, a mythical creature in the form of a white horse with "
          + "a single, long horn on its forehead."),
      EmojiDetails(
        emoji: "🍉",
        name: "Watermelon",
        description: "A slice of watermelon, showing its rich pink flesh, black seeds, and green "
          + "rind."),
      EmojiDetails(
        emoji: "🚴🏽‍♀️",
        name: "Woman Biking",
        description: "The female version of the 🚴 Bicyclist emoji."),
      EmojiDetails(
        emoji: "👩🏽‍💻",
        name: "Woman Technologist",
        description: "A woman behind a computer screen, working in the field of technology."),
      EmojiDetails(
        emoji: "🗺",
        name: "World Map",
        description: "A rectangular map of the world. Generally depicted as a paper map creased at "
          + "its folds, Earth’s surface shown in green on blue ocean."),
    ]
  }

  /// Chooses a random `EmojiDetails` item from the list of all emoji and returns it.
  /// - Returns: A random `EmojiDetails` item.
  static func random() -> EmojiDetails {
    let allEmoji = EmojiProvider.all()
    let randomIndex = Int.random(in: 0..<allEmoji.count)
    return allEmoji[randomIndex]
  }
}
