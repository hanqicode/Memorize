//
//  ThemeModel.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import Foundation

struct ThemeModel {
    let name: String
    let emojis: [String]
    let color: String

    init(name: String, emojis: [String], color: String) {
        self.name = name
        self.emojis = emojis
        self.color = color
    }
}
