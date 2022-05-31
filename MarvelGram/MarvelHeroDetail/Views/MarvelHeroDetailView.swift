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
    lazy var heroImageView: UIImageView = { MarvelHeroDetailView.makeHeroImageView() }()

    // MARK: - Private Properties


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setHeroImageView(image: UIImage?) {
        heroImageView.image = image
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

    static func makeHeroImageView() -> UIImageView {
        let view = UIImageView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }


    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(heroImageView)
        activateHeroImageViewConstraints()

//        addSubview(marvelHeroDetailCollectionView)
//        activateCollectionViewConstraints()
    }

    // MARK: - Layout

    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([

        ])
    }

    private func activateHeroImageViewConstraints() {
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroImageView.heightAnchor.constraint(equalToConstant: 375)
        ])
    }
}

    // MARK: - MarvelHeroDetailCollectionViewDelegate

extension MarvelHeroDetailView: MarvelHeroDetailCollectionViewDelegate {

}
