//
//  DesafiodtiTests.swift
//  DesafiodtiTests
//
//  Created by Carol Bezerra on 20/06/23.
//

import XCTest
@testable import Desafiodti

final class AddPostViewModelTests: XCTestCase {

    private var addPostViewModel: AddPostViewModel!
    private var postsViewModel: PostsViewModel!

    // MARK: - Settings

    override func setUpWithError() throws {
        addPostViewModel = AddPostViewModel()
        postsViewModel = PostsViewModel()
    }

    override func tearDownWithError() throws {
        addPostViewModel = nil
        postsViewModel = nil
    }

    // MARK: - Add new post

    func testAdd_shouldNotAddEmpty() {
        // GIVEN USER DO NOT TYPE ANY INFOR
        let title = ""
        let detail = ""

        // WHEN TAP ON ADD BUTTON
        addPostViewModel.addNew(postTitle: title, postDetail: detail)

        // THEN NOTHING HAPPENS
        XCTAssertEqual(postsViewModel.getPosts().count, 0)
    }

    func testAdd_shouldNotAddEmptyDetail() {
        // GIVEN USER DO NOT WRITE DETAIL TEXT
        let title = "What is Lorem Ipsum?"
        let detail = ""

        // WHEN TAP ON ADD BUTTON
        addPostViewModel.addNew(postTitle: title, postDetail: detail)

        // THEN NOTHING HAPPENS
        XCTAssertEqual(postsViewModel.getPosts().count, 0)
    }

    func testAdd_shouldNotAddEmptyTitle() {
        // GIVEN USER DO NOT WRITE TITLE POST
        let title = ""
        let detail = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

        // WHEN TAP ON ADD BUTTON
        addPostViewModel.addNew(postTitle: title, postDetail: detail)

        // THEN NOTHING HAPPENS
        XCTAssertEqual(postsViewModel.getPosts().count, 0)
    }

    func testAdd_shouldAddNewPost() {
        // GIVEN USER WRITE TITLE AND DETAIL POST
        let title = "Why do we use it?"
        let detail = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."

        // WHEN TAP ON ADD BUTTON
        addPostViewModel.addNew(postTitle: title, postDetail: detail)

        // THEN A NEW POST IS ADDED
        XCTAssertEqual(postsViewModel.getPosts().count, 1)
    }

}
