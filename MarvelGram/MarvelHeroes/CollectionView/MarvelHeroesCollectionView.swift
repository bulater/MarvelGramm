//
//  MarvelHeroesCollectionView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import UIKit

protocol MarvelHeroesCollectionViewDelegate: AnyObject {
    func marvelHeroesCollectionViewGetCellsCount(marvelHeroesCollectionView: MarvelHeroesCollectionView) -> Int?
    func marvelHeroesCollectionView(marvelHeroesCollectionView: MarvelHeroesCollectionView, getSuperHeroViewModelAt index: Int) -> MarvelHeroViewModel?
    func marvelHeroesCollectionView(marvelHeroesCollectionView: MarvelHeroesCollectionView, didselectHeroAtIndex index: Int)
}

class MarvelHeroesCollectionView: UICollectionView {
    // MARK: - Public Properties
    
    weak var customDelegate: MarvelHeroesCollectionViewDelegate?

    // MARK: - Init

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension MarvelHeroesCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customDelegate?.marvelHeroesCollectionViewGetCellsCount(marvelHeroesCollectionView: self) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = MarvelHeroesCollectionViewCell.cellID
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MarvelHeroesCollectionViewCell,
            let viewModel = customDelegate?.marvelHeroesCollectionView(marvelHeroesCollectionView: self, getSuperHeroViewModelAt: indexPath.row)
        else {
            return UICollectionViewCell()
        }

        cell.configure(with: viewModel)

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MarvelHeroesCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        customDelegate?.marvelHeroesCollectionView(marvelHeroesCollectionView: self, didselectHeroAtIndex: indexPath.row)
    }
}
