//
//  ModuleBuilder.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

enum ModuleType {
    case detail(MarvelHeroViewModel?)
    case `default`
}

protocol ModuleBuilder {
    static func createModule(withType type: ModuleType) -> UIViewController
}
