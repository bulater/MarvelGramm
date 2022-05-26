//
//  MarvelHeroesViewController.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

protocol MarvelHeroesViewProtocol: AnyObject {
    func reloadCollectionView()
}

class MarvelHeroesViewController: UIViewController {

    var presenter: MarvelHeroesPresenterProtocol?

    // MARK: - Lifecycle

    override func loadView() {
        let view = MarvelHeroesView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func reloadCollectionView() {
        guard let view = self.view as? MarvelHeroesView else { return }
        view.marvelHeroesCollectionView.reloadData()
    }
}

    // MARK: - MarvelHeroesViewProtocol

extension MarvelHeroesViewController: MarvelHeroesViewProtocol{

}

    // MARK: - MarvelHeroesViewDelegate

extension MarvelHeroesViewController: MarvelHeroesViewDelegate {
    func marvelHeroesViewGetCollectionViewCellsCount(marvelHeroesView: MarvelHeroesView) -> Int? {
        presenter?.getMarvelHeroViewModelCount()
    }

    func marvelHeroesView(marvelHeroesView: MarvelHeroesView, getSuperHeroViewModelAt index: Int) -> MarvelHeroViewModel? {
        presenter?.getMarvelHeroViewModelAt(index: index)
    }
}


struct MarvelHeroesDataSuorce {
    var marvelHeroViewModels: [MarvelHeroViewModel] = []
}
