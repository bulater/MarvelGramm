//
//  MarvelGramModuleBuilder.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

class MarvelGramModuleBuilder: ModuleBuilder {
    static func createModule() -> UIViewController {
        let viewController = MarvelGramViewController()

        return viewController
    }
}
