//
//  MarvelHeroDetailView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import UIKit

protocol MarvelHeroDetailViewDelegate: AnyObject {

}

class MarvelHeroDetailView: UIView {
    // MARK: - Public Properties

    weak var delegate: MarvelHeroDetailViewDelegate?

    lazy var marvelHeroDetailCollectionView: MarvelHeroDetailCollectionView = { MarvelHeroDetailView.makeCollectionView(self) }()

    // MARK: - Private Properties


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Make Subviews

    static func makeCollectionView(_ delegate: MarvelHeroDetailCollectionViewDelegate) ->  MarvelHeroDetailCollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = MarvelHeroDetailCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.customDelegate = delegate
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(MarvelHeroDetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: MarvelHeroDetailCollectionViewCell.cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }


    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(marvelHeroDetailCollectionView)
        activateCollectionViewConstraints()
    }

    // MARK: - Layout

    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}

    // MARK: - MarvelHeroDetailCollectionViewDelegate

extension MarvelHeroDetailView: MarvelHeroDetailCollectionViewDelegate {

}
