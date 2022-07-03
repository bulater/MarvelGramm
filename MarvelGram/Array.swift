//
//  Array.swift
//  MarvelGram
//
//  Created by Булат Сагдиев on 03.07.2022.
//

import Foundation

extension Array {
    func takeElements(elementCount: Int) -> Array {
        if (elementCount > count) {
            return Array(self[0..<count])
        }
        return Array(self[0..<elementCount])
    }
}
