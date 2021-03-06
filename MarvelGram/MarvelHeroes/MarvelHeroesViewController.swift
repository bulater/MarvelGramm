//
//  MarvelHeroesViewController.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

enum Destination {
    case detail(MarvelHeroViewModel?, [MarvelHeroViewModel])
    case heroes
}

protocol MarvelHeroesViewProtocol: AnyObject {
    func reloadCollectionView()
    func navigateTo(destination: Destination)
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
        configureNavigationBar()
    }

    // MARK: - Public Method

    func reloadCollectionView() {
        guard let view = self.view as? MarvelHeroesView else {
            return
        }
        view.marvelHeroesCollectionView.reloadData()
    }

    // MARK: - Private Method

    private func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(named: "background")
    }
}

    // MARK: - MarvelHeroesViewProtocol

extension MarvelHeroesViewController: MarvelHeroesViewProtocol {
    func navigateTo(destination: Destination) {
        switch destination {
        case .detail(let hero, let viewModels):
            let viewController = MarvelHeroDetailModuleBuilder.createModule(withType: .detail(hero, viewModels))
            navigationController?.pushViewController(viewController, animated: true)
        case .heroes:
            break
        }
    }
}

    // MARK: - MarvelHeroesViewDelegate

extension MarvelHeroesViewController: MarvelHeroesViewDelegate {
    func marvelHeroesView(marvelHeroesView: MarvelHeroesView, didselectHeroAtIndex index: Int) {
        presenter?.handleSelectHeroAt(index: index)
    }

    func marvelHeroesViewGetCollectionViewCellsCount(marvelHeroesView: MarvelHeroesView) -> Int? {
        presenter?.getMarvelHeroViewModelCount()
    }

    func marvelHeroesView(marvelHeroesView: MarvelHeroesView, getSuperHeroViewModelAt index: Int) -> MarvelHeroViewModel? {
        presenter?.getMarvelHeroViewModelAt(index: index)
    }
}
