//
//  MarvelGramPresenter.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import Foundation

protocol MarvelGramPresenterProtocol {
}

class MarvelGramPresenter {
    // MARK: - Public Properties

    weak var view: MarvelGramViewProtocol?

    // MARK: - Init

    init(view: MarvelGramViewProtocol) {
        self.view = view
    }
}

    // MARK: - MarvelGramPresenterProtocol

extension MarvelGramPresenter: MarvelGramPresenterProtocol {

}
