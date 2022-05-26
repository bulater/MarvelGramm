//
//  Model.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 31.03.2022.
//

import Foundation

struct SuperHero: Decodable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    let path: String?
    let `extension`: String?
}

    enum Format {
    static let jpg = ".jpg"
}


struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Tnumbnail
}

struct Tnumbnail: Decodable {
    let path: String
    let `extension`: String
}

