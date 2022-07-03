//
//  MarvelHeroesModuleBuilder.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

class MarvelHeroesModuleBuilder: ModuleBuilder {
    static func createModule(withType: ModuleType) -> UIViewController {
        let viewController = MarvelHeroesViewController()
        let marvelHeroesDataSuorce = MarvelHeroesDataSuorce()
        let presenter = MarvelHeroesPresenter(view: viewController, marvelHeroesDataSuorce: marvelHeroesDataSuorce)

        viewController.presenter = presenter

        return viewController
    }
}
