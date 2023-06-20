//
//  PostsViewModel.swift
//  Desafiodti
//
//  Created by Ana Pedroso on 20/06/23.
//

import Foundation

class PostsViewModel: ObservableObject {

    @Published var posts: [Post] = [Post(title: "Mock title", details: "Mock detail")]

    func getPosts() -> [Post] {
        posts
    }
}
