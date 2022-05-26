//
//  MarvelHeroDetailPresenter.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import Foundation

protocol MarvelHeroDetailPresenterProtocol {

}

class MarvelHeroDetailPresenter {
    // MARK: - Public Properties

    weak var view: MarvelHeroDetailViewProtocol?

    // MARK: - Init

    init(view: MarvelHeroDetailViewProtocol) {
        self.view = view
    }
}

// MARK: - MarvelHeroDetailPresenterProtocol

extension MarvelHeroDetailPresenter: MarvelHeroDetailPresenterProtocol {

}
