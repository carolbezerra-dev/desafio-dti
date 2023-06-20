//
//  AddPostView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct AddPostView: View {

    @State private var title: String = ""
    @State private var description: String = ""

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
                        TextField("Título do post", text: $title)
                            .padding(6)
                            .border(.blue)

                        TextField("Descrição do post", text: $description, axis: .vertical)
                            .padding(6)
                            .lineLimit(10, reservesSpace: true)
                            .border(.red)
                    }
                    .padding([.top], 30)
                    .padding([.leading, .trailing], 30)

                    Spacer()

                    Button("Adicionar post") {
                        print("novo")
                    }
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
