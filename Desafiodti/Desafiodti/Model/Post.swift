//
//  Post.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 20/06/23.
//

import Foundation
import SwiftUI

struct Post {
    let id = UUID()
    let title: String
    let date = Text(Date.now, style: .date)
    let details: String
}
