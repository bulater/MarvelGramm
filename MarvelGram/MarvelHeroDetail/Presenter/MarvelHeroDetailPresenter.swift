//
//  MarvelHeroDetailPresenter.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import Foundation

protocol MarvelHeroDetailPresenterProtocol {
    func configureView(viewModel: MarvelHeroViewModel?)
    func handleAppearingView()
}

class MarvelHeroDetailPresenter {
    // MARK: - Public Properties

    weak var view: MarvelHeroDetailViewProtocol?
    var hero: MarvelHeroViewModel?
    var marveHeroDetailDataSource: MarveHeroDetailDataSource

    // MARK: - Init

    init(view: MarvelHeroDetailViewProtocol, marveHeroDetailDataSource: MarveHeroDetailDataSource) {
        self.view = view
        self.marveHeroDetailDataSource = marveHeroDetailDataSource
    }
}

// MARK: - MarvelHeroDetailPresenterProtocol

extension MarvelHeroDetailPresenter: MarvelHeroDetailPresenterProtocol {
    func handleAppearingView() {
        configureView(viewModel: hero)
    }

    func configureView(viewModel: MarvelHeroViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        let image = NetworkManager.shared.getMarvelHeroImage(from: viewModel)
        view?.setHeroImage(image: image)
        view?.setHeroDescription(description: viewModel.description)
        view?.setNavigationBarTitle(title: viewModel.name)
    }
}
