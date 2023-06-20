//
//  PostsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct PostsView: View {

    let barTitle = "Blog App"
    private let screenTitle = "Lista de Posts"

    let posts = [
        Post(title: "titulo 1", date: Text(Date.now, style: .date), details: "detalhes 1"),
        Post(title: "titulo 2", date: Text(Date.now, style: .date), details: "detalhes 2"),
        Post(title: "titulo 3", date: Text(Date.now, style: .date), details: "detalhes 3"),
        Post(title: "titulo 4", date: Text(Date.now, style: .date), details: "detalhes 4"),
        Post(title: "titulo 5", date: Text(Date.now, style: .date), details: "detalhes 5")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text(screenTitle)

                    List {
                        ForEach(posts, id: \.id) { post in
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
