//
//  MarvelHeroDetailPresenter.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import Foundation

protocol MarvelHeroDetailPresenterProtocol {
    func setHeroImage()
}

class MarvelHeroDetailPresenter {
    // MARK: - Public Properties

    weak var view: MarvelHeroDetailViewProtocol?
    var hero: MarvelHeroViewModel?

    // MARK: - Init

    init(view: MarvelHeroDetailViewProtocol) {
        self.view = view
    }
}

// MARK: - MarvelHeroDetailPresenterProtocol

extension MarvelHeroDetailPresenter: MarvelHeroDetailPresenterProtocol {
    func setHeroImage() {
        guard let hero = hero else { return }
        let image = NetworkManager.shared.getMarvelHeroImage(from: hero)
        view?.setHeroImage(image: image)
    }
}
