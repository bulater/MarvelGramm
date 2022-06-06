//
//  MarvelHeroViewModel.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 06.06.2022.
//

import UIKit

struct MarvelHeroViewModel {
    var name: String?
    var description: String?
    var imageURL: String?

    init(hero: SuperHero) {
        self.name = hero.name
        self.description = hero.description
        self.imageURL = hero.thumbnail.path
    }
}

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
