//
//  Entity.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 31.05.2022.
//

import Foundation

struct Card: Codable {
    let cards: [CardElement]
}

// MARK: - CardElement
struct CardElement: Codable {
    let name, manaCost: String
    let cmc: Int
//    let colors: [Color]
//    let colorIdentity: [ColorIdentity]
    let type: String
//    let types: [TypeElement]
    let subtypes: [String]?
//    let rarity: Rarity
//    let cardSet: Set
//    let setName: SetName
    let text, artist, number: String
    let power, toughness: String?
//    let layout: Layout
    let multiverseid: String?
    let imageURL: String?
    let variations: [String]?
//    let foreignNames: [ForeignName]?
    let printings: [String]
    let originalText, originalType: String?
//    let legalities: [LegalityElement]
    let id: String
    let flavor: String?
//    let rulings: [Ruling]?
    let supertypes: [String]?

//    enum CodingKeys: String, CodingKey {
//        case name, manaCost, cmc, colors, colorIdentity, type, types, subtypes, rarity
//        case cardSet
//        case setName, text, artist, number, power, toughness, layout, multiverseid
//        case imageURL
//        case variations, foreignNames, printings, originalText, originalType, legalities, id, flavor, rulings, supertypes
//    }
}

//enum Set: String, Codable {
//    case the10E = "10E"
//}
//
//enum ColorIdentity: String, Codable {
//    case u = "U"
//    case w = "W"
//}

//enum Color: String, Codable {
//    case blue = "Blue"
//    case white = "White"
//}

// MARK: - ForeignName
//struct ForeignName: Codable {
//    let name, text, type: String
//    let flavor: String?
//    let imageURL: String
//    let language: Language
//    let multiverseid: Int
//
//    enum CodingKeys: String, CodingKey {
//        case name, text, type, flavor
//        case imageURL
//        case language, multiverseid
//    }
//}

//enum Language: String, Codable {
//    case chineseSimplified = "Chinese Simplified"
//    case french = "French"
//    case german = "German"
//    case italian = "Italian"
//    case japanese = "Japanese"
//    case portugueseBrazil = "Portuguese (Brazil)"
//    case russian = "Russian"
//    case spanish = "Spanish"
//}
//
//enum Layout: String, Codable {
//    case normal = "normal"
//}


//// MARK: - LegalityElement
//struct LegalityElement: Codable {
//    let format: Format
//    let legality: LegalityEnum
//}
//
//enum Format: String, Codable {
//    case alchemy = "Alchemy"
//    case commander = "Commander"
//    case duel = "Duel"
//    case explorer = "Explorer"
//    case gladiator = "Gladiator"
//    case historic = "Historic"
//    case historicbrawl = "Historicbrawl"
//    case legacy = "Legacy"
//    case modern = "Modern"
//    case pauper = "Pauper"
//    case paupercommander = "Paupercommander"
//    case penny = "Penny"
//    case pioneer = "Pioneer"
//    case premodern = "Premodern"
//    case vintage = "Vintage"
//}
//
//enum LegalityEnum: String, Codable {
//    case legal = "Legal"
//    case restricted = "Restricted"
//}
//
//enum Rarity: String, Codable {
//    case common = "Common"
//    case rare = "Rare"
//    case uncommon = "Uncommon"
//}

// MARK: - Ruling
//struct Ruling: Codable {
//    let date, text: String
//}
//
//enum SetName: String, Codable {
//    case tenthEdition = "Tenth Edition"
//}
//
//enum TypeElement: String, Codable {
//    case creature = "Creature"
//    case enchantment = "Enchantment"
//    case instant = "Instant"
//    case sorcery = "Sorcery"
//}
