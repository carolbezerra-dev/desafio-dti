//
//  UserDefaultHelperMock.swift
//  DesafiodtiTests
//
//  Created by Carol Bezerra on 20/06/23.
//

@testable import Desafiodti

final class UserDefaultsHelperMock: UserDefaultsHelperProtocol {

    func add(_ posts: [Desafiodti.Post]) { }

    func get() -> [Desafiodti.Post] {
        []
    }

    func deleteAll() { }
}
