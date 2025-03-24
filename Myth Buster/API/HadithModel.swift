//
//  HadithData.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/24/25.
//

import Foundation


struct HadithData: Identifiable, Decodable {
    var id: Int
    var status: String
    var hadithEnglish: String
}


struct HadithResponse: Decodable {
    var status: Int
    var message: String
    var hadiths: HadithsContainer

    struct HadithsContainer: Decodable {
        var current_page: Int
        var data: [HadithData]
    }
}
