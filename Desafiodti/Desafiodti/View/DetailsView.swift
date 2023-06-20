//
//  DetailsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct DetailsView: View {

    private let barTitle = PostsView().barTitle
    private let screenTitle = "Detalhes do Post"
    let post: Post

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text(screenTitle)
                        .padding(8)

                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Título").bold()
                            Text(post.title)

                            Spacer(minLength: 20)

                            Text("Data").bold()
                            post.date

                            Spacer(minLength: 20)

                            Text("Descrição").bold()
                            Text(post.details)

                            Spacer(minLength: 20)
                                .frame(maxWidth: .infinity)
                        }
                        .padding(15)

                    }
                    .border(Color("dti-roxo"))
                    .padding()

                    Button {
                        //TODO: ação para excluir
                    } label: {
                        Image(systemName: "trash.fill")
                            .padding(8)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10).fill(.red)
                            )
                    }
                }
                .navigationBarTitle(barTitle, displayMode: .inline)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            post:
                Post(
                    title: "DetailsView",
                    details: "DetailsView_Preview"
                )
        )
        .environment(\.locale, Locale(identifier: "pt"))
    }
}
