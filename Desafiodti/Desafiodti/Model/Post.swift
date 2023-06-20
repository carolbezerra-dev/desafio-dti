//
//  Post.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

struct Post {
    let id = UUID()
    let title: String
    let date: String // TODO: tem que ser do tipo Date
    let details: String
}
