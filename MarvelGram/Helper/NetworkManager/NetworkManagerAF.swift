//
//  NetworkManagerTest.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 02.06.2022.
//

import Foundation
import Alamofire

class NetworkManagerAF {

static var shared = NetworkManagerAF()

    func fetchData(completion: @escaping (Result<[SuperHero], NetworkError>) -> Void) {
        let request = AF.request("https://static.upstarts.work/tests/marvelgram/klsZdDg50j2.json")
        request.responseDecodable(of: [SuperHero].self) { data in
            do {
                guard let hero = data.value else { return }
                completion(.success(hero))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }
    }
}
