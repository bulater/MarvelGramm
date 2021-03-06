//
//  MarvelHeroesView.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import UIKit

protocol MarvelHeroesViewDelegate: AnyObject {
    func marvelHeroesViewGetCollectionViewCellsCount(marvelHeroesView: MarvelHeroesView) -> Int?
    func marvelHeroesView(marvelHeroesView: MarvelHeroesView, getSuperHeroViewModelAt index: Int) -> MarvelHeroViewModel?
    func marvelHeroesView(marvelHeroesView: MarvelHeroesView, didselectHeroAtIndex index: Int)
}

class MarvelHeroesView: UIView {
    // MARK: - Public Properties

    weak var delegate: MarvelHeroesViewDelegate?
    
    lazy var marvelHeroesCollectionView: MarvelHeroesCollectionView = { MarvelHeroesView.makeCollectionView(layout: generateCollectionViewLayout(), delegate: self) }()

    // MARK: - Private Properties

    private enum LayoutConstraints {
        enum CollectionView {
            static let contentInset = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        }
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureView() {
        backgroundColor = UIColor(named: "background")
    }

    // MARK: - Make Subviews

    static func makeCollectionView(layout: UICollectionViewLayout, delegate: MarvelHeroesCollectionViewDelegate) ->  MarvelHeroesCollectionView {
        let collectionView = MarvelHeroesCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.customDelegate = delegate
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(MarvelHeroesCollectionViewCell.self,
                                forCellWithReuseIdentifier: MarvelHeroesCollectionViewCell.cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }

    private func generateCollectionViewLayout() -> UICollectionViewLayout {
        let mainItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1.0)))
        mainItem.contentInsets = LayoutConstraints.CollectionView.contentInset

        let pairItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)))
        pairItem.contentInsets = LayoutConstraints.CollectionView.contentInset

        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1.0)),
            subitem: pairItem,
            count: 2)

        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1/3)),
            subitems: [mainItem, trailingGroup])

        let tripletItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)))
        tripletItem.contentInsets = LayoutConstraints.CollectionView.contentInset

        let tripletGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(2/6)),
            subitems: [tripletItem, tripletItem, tripletItem])

        let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1/3)),
            subitems: [trailingGroup, mainItem])

        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [mainWithPairGroup, tripletGroup, mainWithPairReversedGroup, tripletGroup])

        let section = NSCollectionLayoutSection(group: nestedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(marvelHeroesCollectionView)
        activateCollectionViewConstraints()
    }

    // MARK: - Layout

    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            marvelHeroesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            marvelHeroesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            marvelHeroesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            marvelHeroesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

    // MARK: - MarvelHeroesCollectionViewDelegate

extension MarvelHeroesView: MarvelHeroesCollectionViewDelegate {
    func marvelHeroesCollectionView(marvelHeroesCollectionView: MarvelHeroesCollectionView, didselectHeroAtIndex index: Int) {
        delegate?.marvelHeroesView(marvelHeroesView: self, didselectHeroAtIndex: index)
    }

    func marvelHeroesCollectionViewGetCellsCount(marvelHeroesCollectionView: MarvelHeroesCollectionView) -> Int? {
        delegate?.marvelHeroesViewGetCollectionViewCellsCount(marvelHeroesView: self)
    }

    func marvelHeroesCollectionView(marvelHeroesCollectionView: MarvelHeroesCollectionView, getSuperHeroViewModelAt index: Int) -> MarvelHeroViewModel? {
        delegate?.marvelHeroesView(marvelHeroesView: self, getSuperHeroViewModelAt: index)
    }
}
