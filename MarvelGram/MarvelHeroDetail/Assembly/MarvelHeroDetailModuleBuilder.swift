//
//  MarvelHeroDetailModuleBuilder.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import UIKit

class MarvelHeroDetailModuleBuilder: ModuleBuilder {
    static func createModule() -> UIViewController {
        let viewController = MarvelHeroDetailViewController()
        let presenter = MarvelHeroDetailPresenter(view: viewController)

        viewController.presenter = presenter

        return viewController
    }
}
