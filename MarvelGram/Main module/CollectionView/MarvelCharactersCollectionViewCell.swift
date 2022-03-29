//
//  CharactersCollectionViewCell.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 29.03.2022.
//

import UIKit

class MarvelCharactersCollectionViewCell: UICollectionViewListCell {
    // MARK: - Public Propertires

    static let reuseID = "CharactersCollectionViewCellID"

    // MARK: - Private Propertires

    lazy private var imageView: UIImageView = { MarvelCharactersCollectionViewCell.makeImageView() }()
    lazy private var contentContainer: UIView = { MarvelCharactersCollectionViewCell.makeContentContainerView() }()


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Make Subviews

    static func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    static func makeContentContainerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }

    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(contentContainer)
        activateContentContainerConstraints()

        contentContainer.addSubview(imageView)
        activateImageViewConstraints()
    }

    // MARK: - Layout

    private func activateContentContainerConstraints() {
        NSLayoutConstraint.activate([
            contentContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentContainer.topAnchor.constraint(equalTo: topAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func activateImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: contentContainer.topAnchor)
        ])
    }
}
