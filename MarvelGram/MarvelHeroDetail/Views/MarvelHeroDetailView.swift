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
    lazy var heroDescriptionLabel: UILabel = { MarvelHeroDetailView.makeHeroDectriptionLabel() }()

    // MARK: - Private Properties


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubViews()
        configureHeroDescriptionLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setHeroImage(image: UIImage?) {
        heroImageView.image = image
    }

    func setHeroDescription(description: String?) {
        heroDescriptionLabel.text = description
    }

    // MARK: - Private Methods

    private func configureView() {
        backgroundColor = UIColor(named: "background")
    }

    private func configureHeroDescriptionLabel() {
        guard let attributedText = heroDescriptionLabel.attributedText else { return }
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 24
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange(location: 0, length: attributedString.length))
        heroDescriptionLabel.attributedText = attributedString
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

    static func makeHeroDectriptionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.backgroundColor = UIColor(named: "background")
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }


    // MARK: - Add SubViews

    private func addSubViews() {
        addSubview(heroImageView)
        activateHeroImageViewConstraints()

        addSubview(heroDescriptionLabel)
        activateHeroDescriptionLabelViewConstraints()


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
            heroImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroImageView.heightAnchor.constraint(equalToConstant: 375)
        ])
    }

    private func activateHeroDescriptionLabelViewConstraints() {
        NSLayoutConstraint.activate([
            heroDescriptionLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor),
            heroDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroDescriptionLabel.heightAnchor.constraint(equalToConstant: 132)
        ])
    }
}

    // MARK: - MarvelHeroDetailCollectionViewDelegate

extension MarvelHeroDetailView: MarvelHeroDetailCollectionViewDelegate {

}
