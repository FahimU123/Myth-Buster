//
//  Misconceptions.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/7/25.
//

import Foundation

enum Misconception: String, CaseIterable, Identifiable {
    var id: Self {self}
    
    case jihad = "Jihad"
    case womenInIslam = "Women in Islam"
    case sharia =  "Sharia"
    case treatmentofOtherReligions = "Treatment of Other Religions"
    
    var content: String {
        switch self {
        case .jihad:
            return """
                Often misunderstood, the term 'jihad' literally means 'struggle' or 'striving.' In Islam, it refers to the internal struggle against sin as
                well as a duty to protect and improve society, which is distinct from acts of extremism.
                """
        case .womenInIslam:
            return """
                Women are granted numerous rights in Islam including education, ownership of property, and participation in social and economic activities.
                Their roles are diverse and culturally influenced, and Islamic teachings emphasize respect and dignity.
                """
        case .treatmentofOtherReligions:
            return """
                Islam promotes respectful coexistence. While historical contexts vary, classical Islamic texts call for tolerance and protection of
                'People of the Book' (Jews and Christians) and encourage peaceful interaction.
                """
        case .sharia:
            return """
                Sharia is a comprehensive legal and ethical system derived from the Quran and Sunnah. It covers personal conduct, family life, and community
                responsibilities, with interpretations that vary widely across cultures and contexts.
                """
        }
    }
}
