//
//  MarvelGramView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//


import UIKit

protocol MarvelGramViewDelegate: AnyObject {
}

class MarvelGramView: UIView {
    // MARK: - Public Properties

    weak var delegate: MarvelGramViewDelegate?

    // MARK: - Private Properties

    lazy private var collectionView: MarvelCharactersCollectionView = { MarvelGramView.makeCollectionView(layout: generateCollectionViewLayout()) }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Make Subviews

    static func makeCollectionView(layout: UICollectionViewLayout) ->  MarvelCharactersCollectionView {
        let collectionView = MarvelCharactersCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(MarvelCharactersCollectionViewCell.self,
                                forCellWithReuseIdentifier: MarvelCharactersCollectionViewCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }

    private func generateCollectionViewLayout() -> UICollectionViewLayout {
        let mainItem = NSCollectionLayoutItem(
                  layoutSize: NSCollectionLayoutSize(
                      widthDimension: .fractionalWidth(2/3),
                      heightDimension: .fractionalHeight(1.0)))
        mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        let pairItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)))
        pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1.0)),
            subitem: pairItem,
            count: 2)

        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.7)),
            subitems: [mainItem, trailingGroup])

        let tripletItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(0.9)))
        tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        let tripletGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.4)),
            subitems: [tripletItem, tripletItem, tripletItem])

        let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.7)),
            subitems: [trailingGroup, mainItem])

        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(10)),
            subitems: [mainWithPairGroup, tripletGroup, mainWithPairReversedGroup, tripletGroup])

        let section = NSCollectionLayoutSection(group: nestedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }


    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(collectionView)
        activateCollectionViewConstraints()
    }

    // MARK: - Layout

    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
