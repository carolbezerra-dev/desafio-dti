//
//  PostsViewModelTests.swift
//  DesafiodtiTests
//
//  Created by Carol Bezerra on 21/06/23.
//

import XCTest
@testable import Desafiodti

final class PostsViewModelTests: XCTestCase {

    private var userDefaultsMock: UserDefaultsHelperMock!
    private var postsViewModel: PostsViewModel!

    // MARK: - Settings

    override func setUp() {
        userDefaultsMock = UserDefaultsHelperMock()
        postsViewModel = PostsViewModel(userDefaults: userDefaultsMock)
    }

    override func tearDown() {
        userDefaultsMock = nil
        postsViewModel = nil
    }

    // MARK: - Get posts

    func testGet_shouldReturnEmpty() {
        // GIVEN USER OPEN APP FOR THE FIRST TIME
        postsViewModel.get()

        // POSTS ARE UPDATED
        // AND THERE IS NO POST
        XCTAssertEqual(postsViewModel.posts.count, 0)
    }

    // MARK: - Delete all posts

    func testDelete_shouldDeleteAllPosts() {
        // GIVEN USER CREATE POSTS
        // AND RETURN TO POSTS SCREEN
        postsViewModel.get()

        // WHEN TAP ON DELETE ALL BUTTON
        postsViewModel.deleteAll()

        // THEN ALL POSTS ARE DELETED
        XCTAssertEqual(postsViewModel.posts.count, 0)
    }
}
