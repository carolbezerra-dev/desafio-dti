//
//  PostsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct PostsView: View {

    @StateObject var postsViewModel = PostsViewModel()
    let barTitle = "Blog App"
    private let screenTitle = "Lista de Posts"

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text(screenTitle)

                    List {
                        ForEach(postsViewModel.getPosts(), id: \.id) { post in
                            NavigationLink {
                                DetailsView(post: post)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(post.title)
                                    post.date
                                }
                            }
                        }
                    }

                    NavigationLink {
                        AddPostView()
                    } label: {
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 33))
                            .tint(Color("dti-blue"))
                    }
                    .padding([.top], 2)
                }
            }
            .navigationBarTitle(barTitle, displayMode: .inline)
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
            .environment(\.locale, Locale(identifier: "pt"))
    }
}
