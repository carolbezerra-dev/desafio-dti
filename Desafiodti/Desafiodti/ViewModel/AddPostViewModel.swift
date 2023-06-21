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

    func formateDate() -> String {
        let date = Date.now
        let formatter = DateFormatter()

        formatter.dateFormat = "dd/MM/YYYY"

        return formatter.string(from: date)
    }

    func addNew(postTitle: String, postDetail: String) {
        let dateFormatted = formateDate()

        if (postTitle != "" && postDetail != "") {
            let new = Post(id: UUID(), date: dateFormatted, title: postTitle, details: postDetail)
            posts.append(new)
            userDefaultsHelper.add(posts)
        }
    }
}
