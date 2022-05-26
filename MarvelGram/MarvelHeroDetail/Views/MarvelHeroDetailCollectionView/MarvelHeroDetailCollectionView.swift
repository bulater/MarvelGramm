//
//  MarvelHeroDetailCollectionView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 26.05.2022.
//

import UIKit

protocol MarvelHeroDetailCollectionViewDelegate: AnyObject {

}

class MarvelHeroDetailCollectionView: UICollectionView {
    // MARK: - Public Properties

    weak var customDelegate: MarvelHeroDetailCollectionViewDelegate?

    // MARK: - Private Properties



    // MARK: - Init

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods



    // MARK: - Public Methods

}

// MARK: - UICollectionViewDataSource

extension MarvelHeroDetailCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = MarvelHeroDetailCollectionViewCell.cellID
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID,
                                                            for: indexPath) as? MarvelHeroDetailCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MarvelHeroDetailCollectionView: UICollectionViewDelegateFlowLayout {

}
