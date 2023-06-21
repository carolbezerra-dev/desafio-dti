//
//  AddPostViewModel.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation

class PostsViewModel: ObservableObject {

    private var userDefaultsHelper: UserDefaultsHelperProtocol
    @Published private(set) var posts: [Post] = []

    init(userDefaults: UserDefaultsHelperProtocol = UserDefaultsHelper()) {
        self.userDefaultsHelper = userDefaults
        get()
    }

    func get() {
        posts = userDefaultsHelper.get()
    }

    func deleteAll() {
        posts.removeAll()
        userDefaultsHelper.deleteAll()
        get()
    }
}
