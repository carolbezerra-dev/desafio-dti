//
//  AddPostViewModel.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

class AddPostViewModel: ObservableObject {

    var postsViewModel = PostsViewModel()

    func addNew(postTitle: String, postDetail: String) {
        if (postTitle != "" && postDetail != "") {
            postsViewModel.posts.append(Post(title: postTitle, details: postDetail))
            postsViewModel.posts.append(Post(title: "Mock Add View Model", details: "Mock 2"))
//            posts.append(Post(title: postTitle, details: postDetail))
            print(postsViewModel.posts)
        }
    }
}
