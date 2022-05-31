//
//  MarvelHeroDetailModuleBuilder.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import UIKit

class MarvelHeroDetailModuleBuilder: ModuleBuilder {
    static func createModule(withType type: ModuleType) -> UIViewController {
        let viewController = MarvelHeroDetailViewController()
        let presenter = MarvelHeroDetailPresenter(view: viewController)

        viewController.presenter = presenter

        switch type {
        case .detail(let heroViewModel):
            presenter.hero = heroViewModel
        case .default:
            break
        }

        return viewController
    }
}
