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


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Make Subviews


    // MARK: - Add SubViews



    // MARK: - Layout

}
