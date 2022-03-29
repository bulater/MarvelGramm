//
//  MarvelCharactersCollectionView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import UIKit

class MarvelCharactersCollectionView: UICollectionView {

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

extension MarvelCharactersCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseID = MarvelCharactersCollectionViewCell.reuseID
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? MarvelCharactersCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.contentView.backgroundColor = .red

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MarvelCharactersCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
}
