//
//  AddPostViewModel.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

class AddPostViewModel: ObservableObject {

    private var userDefaultsHelper: UserDefaultsHelperProtocol
    @Published private(set) var posts: [Post] = []

    init(userDefaults: UserDefaultsHelperProtocol = UserDefaultsHelper()) {
        self.userDefaultsHelper = userDefaults
        let savedPosts = userDefaultsHelper.get()
        posts = savedPosts
    }

    func addNew(_ postTitle: String, _ postDetails: String) {
        let today = BrazilianFormatDate().today()

        if (postTitle != "" && postDetails != "") {
            let new = Post(id: UUID(), date: today, title: postTitle, details: postDetails)
            posts.append(new)
            userDefaultsHelper.add(posts)
            APIFetchHandler.sharedInstance.postAPIData()
        }
    }
}
