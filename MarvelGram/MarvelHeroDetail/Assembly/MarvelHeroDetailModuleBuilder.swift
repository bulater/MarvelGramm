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
        let marveHeroDetailDataSource = MarveHeroDetailDataSource()
        let presenter = MarvelHeroDetailPresenter(view: viewController, marveHeroDetailDataSource: marveHeroDetailDataSource)

        viewController.presenter = presenter

        switch type {
        case .detail(let hero, let viewModels):
            presenter.hero = hero
            presenter.marveHeroDetailDataSource.marvelHeroViewModels = viewModels
        case .default:
            break
        }

        return viewController
    }
}
