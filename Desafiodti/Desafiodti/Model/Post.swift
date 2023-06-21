//
//  Post.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

struct Post: Codable {
    let id: UUID
    let date: String
    let title: String
    let details: String
}
