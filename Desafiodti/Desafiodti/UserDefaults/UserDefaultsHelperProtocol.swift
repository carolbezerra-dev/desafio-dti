//
//  UserDefaultsHelperProtocol.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

protocol UserDefaultsHelperProtocol {
    func add(_ posts: [Post])
    func get() -> [Post]
    func deleteAll()
}
