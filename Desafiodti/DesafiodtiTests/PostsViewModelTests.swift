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
    private var addPostViewModel: AddPostViewModel!

    // MARK: - Settings

    override func setUp() {
        userDefaultsMock = UserDefaultsHelperMock()
        postsViewModel = PostsViewModel(userDefaults: userDefaultsMock)
        addPostViewModel = AddPostViewModel(userDefaults: userDefaultsMock)
    }

    override func tearDown() {
        userDefaultsMock = nil
        postsViewModel = nil
        addPostViewModel = nil
    }

    // MARK: - Get posts

    func testGet_shouldReturnEmpty() {
        // GIVEN USER OPEN APP FOR THE FIRST TIME
        postsViewModel.get()

        // POSTS ARE UPDATED
        // AND THERE IS NO POST
        XCTAssertEqual(postsViewModel.posts.count, 0)
    }

    func testGet_shouldReturnPostsSaved() {
        // GIVEN USER CREATE A NEW POST
        let postTitle = "Where can I get some?"
        let postDetails = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
        addPostViewModel.addNew(postTitle, postDetails)

        // WHEN RETURN TO POSTS SCREEN
        postsViewModel.get()

        // THEN THERE IS THE POST CREATED
        XCTAssertEqual(postsViewModel.posts.count, 1)
        postsViewModel.get()
        XCTAssertEqual(postsViewModel.posts.count, 1)
    }

    // MARK: - Delete all posts

    func testDelete_shouldDeleteAllPosts() {
        // GIVEN USER CREATE POSTS
        let postTitle = "First paragraph"
        let postDetails = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis auctor libero sed odio suscipit, sed consequat lacus mattis. Donec id arcu et erat sagittis scelerisque hendrerit non felis. Donec vitae libero commodo, iaculis neque eu, accumsan diam. Donec lacus ex, pretium vel turpis eget, lacinia lacinia ante. Cras dignissim quis leo vitae ultrices. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce ante justo, aliquet at nisi quis, rhoncus elementum mi. Pellentesque in diam a arcu congue congue ut vitae felis. Pellentesque suscipit tellus id felis luctus, vitae tincidunt metus pretium. Integer sed pretium lectus, a finibus arcu. Proin urna quam, laoreet a neque quis, dignissim dapibus nulla. Fusce sit amet elementum est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean ac nunc pellentesque, vulputate augue quis, consequat ante."
        addPostViewModel.addNew(postTitle, postDetails)

        // AND RETURN TO POSTS SCREEN
        postsViewModel.get()

        XCTAssertEqual(postsViewModel.posts.count, 1)

        // WHEN TAP ON DELETE ALL BUTTON
        postsViewModel.deleteAll()

        // THEN ALL POSTS ARE DELETED
        XCTAssertEqual(postsViewModel.posts.count, 0)
    }
}
