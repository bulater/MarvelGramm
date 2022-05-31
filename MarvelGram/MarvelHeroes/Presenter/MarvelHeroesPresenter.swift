//
//  MarvelHeroesPresenter.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import Foundation

protocol MarvelHeroesPresenterProtocol {
    func getMarvelHeroViewModelAt(index: Int) -> MarvelHeroViewModel?
    func getMarvelHeroViewModelCount() -> Int?
    func handleSelectHeroAt(index: Int)
}

class MarvelHeroesPresenter {
    // MARK: - Public Properties

    weak var view: MarvelHeroesViewProtocol?
    var marvelHeroesDataSuorce = MarvelHeroesDataSuorce()

    // MARK: - Init

    init(view: MarvelHeroesViewProtocol) {
        self.view = view
        fetchMarvelHeroModels()
    }

    // MARK: - Private Methods

    private func fetchMarvelHeroModels() {
        NetworkManager.shared.fetchMarvelHeroesData { result in
            switch result {
            case .success(let data):
                let viewModels = data.map { MarvelHeroViewModel(hero: $0) }
                self.marvelHeroesDataSuorce.marvelHeroViewModels = viewModels
                DispatchQueue.main.async {
                    self.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

    // MARK: - MarvelHeroesPresenterProtocol

extension MarvelHeroesPresenter: MarvelHeroesPresenterProtocol {
    func handleSelectHeroAt(index: Int) {
        let heroViewModel = marvelHeroesDataSuorce.marvelHeroViewModels[index]
        view?.navigateTo(destination: .detail(heroViewModel))
    }

    func getMarvelHeroViewModelAt(index: Int) -> MarvelHeroViewModel? {
        marvelHeroesDataSuorce.marvelHeroViewModels[index]
    }

    func getMarvelHeroViewModelCount() -> Int? {
        return marvelHeroesDataSuorce.marvelHeroViewModels.count
    }
}
