//
//  MarvelHeroDetailViewController.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import UIKit

protocol MarvelHeroDetailViewProtocol: AnyObject {
    func setHeroImage(image: UIImage?)
    func setHeroDescription(description: String?)
    func setNavigationBarTitle(title: String?)
}

class MarvelHeroDetailViewController: UIViewController {
    // MARK: - Public Properties

    var presenter: MarvelHeroDetailPresenterProtocol?

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        let view = MarvelHeroDetailView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        counfigureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.handleAppearingView()
    }

    // MARK: - Private Methods

    private func counfigureNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    // MARK: - Public Methods

}

// MARK: - MarvelHeroDetailViewProtocol

extension MarvelHeroDetailViewController: MarvelHeroDetailViewProtocol {
    func setNavigationBarTitle(title: String?) {
        self.title = title
    }

    func setHeroImage(image: UIImage?) {
        guard let view = view as? MarvelHeroDetailView else {
            return
        }
        view.setHeroImage(image: image)
    }

    func setHeroDescription(description: String?) {
        guard let view = view as? MarvelHeroDetailView else {
            return
        }
        view.setHeroDescription(description: description)
    }
}

// MARK: - MarvelHeroDetailViewDelegate

extension MarvelHeroDetailViewController: MarvelHeroDetailViewDelegate {
    
}
