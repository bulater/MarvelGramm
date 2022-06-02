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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.setHeroImage()
        presenter?.setHeroDescription()
    }

    // MARK: - Private Methods

    private func addSubViews() {

    }

    // MARK: - Public Methods

    

    // MARK: - Create Subviews

    //    static func make() ->  {
    //
    //    }

    // MARK: - Layout

    private func activateConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}

// MARK: - MarvelHeroDetailViewProtocol

extension MarvelHeroDetailViewController: MarvelHeroDetailViewProtocol {
    func setHeroImage(image: UIImage?) {
        guard let view = view as? MarvelHeroDetailView else { return }
        view.setHeroImage(image: image)
    }

    func setHeroDescription(description: String?) {
        guard let view = view as? MarvelHeroDetailView else { return }
        view.setHeroDescription(description: description)
    }
}

// MARK: - MarvelHeroDetailViewDelegate

extension MarvelHeroDetailViewController: MarvelHeroDetailViewDelegate {
    
}
