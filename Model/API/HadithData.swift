//
//  HadithData.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/18/25.
//

import Foundation

struct HadithData: Identifiable, Decodable {
    var id: Int
    var hadithNumber: String
    var englishNarrator: String
    var hadithEnglish: String
    var hadithUrdu: String

    // CodingKeys to map JSON keys to struct properties
//    enum CodingKeys: String, CodingKey {
//        case id
//        case hadithNumber = "hadithNumber"
//        case englishNarrator = "englishNarrator"
//        case hadithEnglish = "hadithEnglish"
//        case hadithUrdu = "hadithUrdu"
//    }
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
