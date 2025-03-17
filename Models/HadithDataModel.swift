//
//  HadithDataModel.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/17/25.
//

import Foundation


struct HadithDataModel: Codable, Identifiable {
    let id: Int
    var name: String
    var book: String
    var link: String
    var linkmini: String
}
