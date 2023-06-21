//
//  PostsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct PostsView: View {

    @StateObject private var postsViewModel = PostsViewModel()
    @StateObject private var addPostViewModel = AddPostViewModel()
    
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
                        ForEach(postsViewModel.posts, id: \.id) { post in
                            NavigationLink {
                                DetailsView(post: post)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(post.title)
                                    Text(post.date)
                                }
                            }
                        }
                    }

                    HStack {
                        Button {
                            postsViewModel.deleteAll()
                        } label: {
                            Text("Apagar tudo")
                                .padding(5)
                        }
                        .font(.system(size: 15))
                        .tint(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10).fill(.red)
                        )

                        NavigationLink {
                            AddPostView()
                        } label: {
                            Text("Novo")
                            Image(systemName: "plus.rectangle")
                        }
                        .padding(5)
                        .bold()
                        .font(.system(size: 15))
                        .tint(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10).fill(Color("dti-blue"))
                        )
                    }
                }
            }
            .onAppear {
                postsViewModel.get()
            }
            .navigationBarTitle(barTitle, displayMode: .inline)
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
