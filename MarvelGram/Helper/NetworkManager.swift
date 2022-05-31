//
//  NetworkManager.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 31.03.2022.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    // MARK: - Private Properties

    static let shared = NetworkManager()

    private let marvelURLString = "https://static.upstarts.work/tests/marvelgram/klsZdDg50j2.json"
    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    // MARK: - Public Methods

    func fetchMarvelHeroesData(completion: @escaping (Result<[SuperHero], NetworkError>) -> Void) {
        guard let url = URL(string: marvelURLString) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = session.dataTask(with: url) { data, _, error in
            guard let parseredData = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedData = try self.decoder.decode([SuperHero].self, from: parseredData)
                completion(.success(decodedData))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }

    func setMarvelHeroImage(from model: MarvelHeroViewModel, image: UIImageView?) {
        let imageCahche = ImageCache.shared
        if let imageFromCache = imageCahche.object(forKey: (model.imageURL ?? "") + Format.jpg as NSString) {
            image?.image = imageFromCache
            return
        }

        let imageURLString = model.imageURL
        DispatchQueue.global().async {
            guard let url = model.imageURL,
                let imageUrl = URL(string: url + Format.jpg),
                let imageData = try? Data(contentsOf: imageUrl)
            else {
                return
            }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: imageData) else { return }
                if imageURLString == url {
                    image?.image = imageToCache
                }

                imageCahche.setObject(imageToCache, forKey: (model.imageURL ?? "") + Format.jpg as NSString)
            }
        }
    }

    func getMarvelHeroImage(from model: MarvelHeroViewModel) -> UIImage {
        var image = UIImage()
        let imageCahche = ImageCache.shared
        if let imageFromCache = imageCahche.object(forKey: (model.imageURL ?? "") + Format.jpg as NSString) {
            image = imageFromCache
            return image
        }

        let imageURLString = model.imageURL
        DispatchQueue.global().async {
            guard let url = model.imageURL,
                let imageUrl = URL(string: url + Format.jpg),
                let imageData = try? Data(contentsOf: imageUrl)
            else {
                return
            }

            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: imageData) else { return }
                if imageURLString == url {
                    image = imageToCache
                }

                imageCahche.setObject(imageToCache, forKey: (model.imageURL ?? "") + Format.jpg as NSString)
            }
        }

        return image
    }
}

struct MarvelHeroViewModel {
    var name: String?
    var description: String?
    var imageURL: String?

    init(hero: SuperHero) {
        self.name = hero.name
        self.description = hero.description
        self.imageURL = hero.thumbnail.path
    }
}

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

