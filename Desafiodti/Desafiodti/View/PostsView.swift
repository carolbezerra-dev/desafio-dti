//
//  PostsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct PostsView: View {

    let barTitle = "Blog App"

    let posts = [
        Post(title: "titulo 1", date: "01/01/2001", details: "detalhes 1"),
        Post(title: "titulo 2", date: "02/02/2012", details: "detalhes 2"),
        Post(title: "titulo 3", date: "03/03/2023", details: "detalhes 3"),
        Post(title: "titulo 4", date: "04/04/2004", details: "detalhes 4"),
        Post(title: "titulo 5", date: "05/05/2015", details: "detalhes 5")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text("Lista de Posts")
                    List {
                        ForEach(posts, id: \.id) { post in
                            VStack(alignment: .leading) {
                                Text(post.title)
                                Text(post.date)

                            }
                        }
                    }


                    //                    Spacer()

                    Button("Novo post") {
                        print("novo")
                    }
                }
                .navigationBarTitle(barTitle, displayMode: .inline)

            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
