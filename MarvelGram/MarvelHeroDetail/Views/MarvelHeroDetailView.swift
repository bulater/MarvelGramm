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

    private enum LayoutConstraints {
        enum ImageView {
            static let heightAnchor: CGFloat = 375
        }

        enum DescriptionLabel {
            static let lineSpacing: CGFloat = 24
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let heightAnchor: CGFloat = 132
        }

        enum DetailCollectionView {
            static let topAnchor: CGFloat = 30
            static let bottomAnchor: CGFloat = 10
            static let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }

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
        paragraphStyle.lineSpacing = LayoutConstraints.DescriptionLabel.lineSpacing
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle],
                                       range: NSRange(location: 0, length: attributedString.length))
        heroDescriptionLabel.attributedText = attributedString
    }

    // MARK: - Make Subviews

    static func makeCollectionView(_ delegate: MarvelHeroDetailCollectionViewDelegate) ->  MarvelHeroDetailCollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = LayoutConstraints.DetailCollectionView.sectionInset
        let collectionView = MarvelHeroDetailCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.customDelegate = delegate
        collectionView.backgroundColor = UIColor(named: "background")
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


        addSubview(marvelHeroDetailCollectionView)
        activateCollectionViewConstraints()
    }

    // MARK: - Layout

    private func activateHeroImageViewConstraints() {
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroImageView.heightAnchor.constraint(equalToConstant: LayoutConstraints.ImageView.heightAnchor)
        ])
    }

    private func activateHeroDescriptionLabelViewConstraints() {
        NSLayoutConstraint.activate([
            heroDescriptionLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor),
            heroDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                          constant: LayoutConstraints.DescriptionLabel.leadingAnchor),
            heroDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                           constant: LayoutConstraints.DescriptionLabel.trailingAnchor),
            heroDescriptionLabel.heightAnchor.constraint(equalToConstant: LayoutConstraints.DescriptionLabel.heightAnchor)
        ])
    }

    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            marvelHeroDetailCollectionView.topAnchor.constraint(equalTo: heroDescriptionLabel.bottomAnchor,
                                                                constant: LayoutConstraints.DetailCollectionView.topAnchor),
            marvelHeroDetailCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                                   constant: LayoutConstraints.DetailCollectionView.bottomAnchor),
            marvelHeroDetailCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            marvelHeroDetailCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

    // MARK: - MarvelHeroDetailCollectionViewDelegate

extension MarvelHeroDetailView: MarvelHeroDetailCollectionViewDelegate {

}
