//
//  MarvelGramViewController.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 28.03.2022.
//

import UIKit

protocol MarvelGramViewProtocol: AnyObject {
}

class MarvelGramViewController: UIViewController {

    override func loadView() {
        let view = MarvelGramView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
}

    // MARK: - MarvelGramViewProtocol

extension MarvelGramViewController: MarvelGramViewProtocol{

}

    // MARK: - MarvelGramViewDelegate

extension MarvelGramViewController: MarvelGramViewDelegate {
}
