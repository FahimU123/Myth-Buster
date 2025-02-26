//
//  CoreBelifsList.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 2/26/25.
//

import SwiftUI

struct CoreBeliefsList: View {
    let beliefs: [CoreBelief] = [
        CoreBelief(
            title: "Belief in God (Allah)",
            shortDescription: "Belief in the one and only God, Allah.",
            detailedDescription: "In Islam, the belief in God is the cornerstone of faith. This entails believing in one God, Allah, who is unique, without partners or equals. He is the Creator and Sustainer of the universe, all-knowing, all-powerful, and merciful..."
        ),
        CoreBelief(
            title: "Belief in Angels",
            shortDescription: "Belief in the existence of angels.",
            detailedDescription: "Angels are created beings of light who serve God. They are messengers, guardians, and executors of God's will. They do not have free will and are completely obedient to God..."
        ),
  
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(beliefs) { belief in
                    CoreBeliefView(belief: belief)
                }
            }
            .padding()
        }
        .navigationTitle("Core Beliefs")
    }
}

#Preview {
    CoreBeliefsList()
}
