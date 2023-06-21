//
//  AddPostView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct AddPostView: View {

    @State private var postTitle: String = ""
    @State private var postDetail: String = ""
    @StateObject private var addPostViewModel = AddPostViewModel()

    private let barTitle = PostsView().barTitle
    private let screenTitle = "Adicionar Post"

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text(screenTitle)
                        .padding(8)

                    VStack(spacing: 30) {
                        TextField("Título", text: $postTitle)
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("dti-roxo"), lineWidth: 1)
                            )

                        TextField("Escreva aqui seu post", text: $postDetail, axis: .vertical)
                            .padding(6)
                            .lineLimit(10, reservesSpace: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("dti-roxo"), lineWidth: 1)
                            )
                    }
                    .padding([.top], 30)
                    .padding([.leading, .trailing], 30)

                    Spacer()

                    Button {
                        addPostViewModel.addNew(postTitle: postTitle, postDetail: postDetail)
                    } label: {
                        Text("Adicionar")
                        Image(systemName: "plus.rectangle")
                    }
                    .padding(5)
                    .font(.system(size: 15))
                    .bold()
                    .tint(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(Color("dti-blue"))
                    )
                }
                .navigationBarTitle(barTitle, displayMode: .inline)
            }
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
