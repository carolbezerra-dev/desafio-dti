//
//  DetailsView.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import SwiftUI

struct DetailsView: View {

    let barTitle = "Blog App"

    let post = Post(title: "como ", date: "01/01/2001", details: "como ")

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 0)
                        .background(Color("dti-color"))

                    Text("Detalhes do Post")
                        .padding(8)

                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Título").bold()
                            Text(post.title)

                            Spacer(minLength: 20)

                            Text("Data").bold()
                            Text(post.date)

                            Spacer(minLength: 20)

                            Text("Descrição").bold()
                            Text(post.details)

                            Spacer(minLength: 20)
                                .frame(maxWidth: .infinity)
                        }
                        .padding(15)

                    }
                    .border(.blue)
                    .padding()
                    .frame(minWidth: .zero)

                    Spacer()

                    Button("Excluir post") {
                        print("novo")
                    }
                }
                .navigationBarTitle(barTitle, displayMode: .inline)

            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
