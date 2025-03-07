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
            detailedDescription: "In Islam, the belief in God is the cornerstone of faith. This entails believing in one God, Allah, who is unique, without partners or equals. He is the Creator and Sustainer of the universe, all-knowing, all-powerful, and merciful."
        ),
        CoreBelief(
            title: "Belief in Angels",
            shortDescription: "Belief in the existence of angels.",
            detailedDescription: "Angels are created beings of light who serve God. They are messengers, guardians, and executors of God's will. They do not have free will and are completely obedient to God."
        ),
        CoreBelief(
               title: "Belief in the Revealed Books",
               shortDescription: "Belief in the divine books revealed to prophets.",
               detailedDescription: "Muslims believe that God revealed books to various prophets, including the Torah (Tawrat), the Psalms (Zabur), the Gospel (Injil), and the Quran, which is considered the final revelation and the literal word of God. Muslims believe that previous scriptures have been altered over time, while the Quran remains unchanged and protected by God."
           ),
           CoreBelief(
               title: "Belief in the Prophets",
               shortDescription: "Belief in all the prophets sent by God.",
               detailedDescription: "Muslims believe in all the prophets sent by God, starting with Adam, and including Noah, Abraham, Moses, Jesus, and Muhammad (peace be upon them all). Muhammad is considered the final prophet, and his message completes and perfects the previous revelations."
           ),
           CoreBelief(
               title: "Belief in the Day of Judgment",
               shortDescription: "Belief in the Day of Resurrection and Judgment.",
               detailedDescription: "Muslims believe that there will be a Day of Judgment when all people will be resurrected and held accountable for their actions in this life. God will judge everyone based on their deeds, and they will be rewarded with Paradise (Jannah) or punished with Hellfire (Jahannam)."
           ),
           CoreBelief(
               title: "Belief in Divine Decree (Qadar)",
               shortDescription: "Belief in God's divine decree and predestination.",
               detailedDescription: "Muslims believe that God has knowledge and control over everything that happens. This includes both good and bad events. While God has decreed everything, humans are given free will to make choices, and they are responsible for their actions. This concept balances divine decree with human responsibility."
           )
  
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
    }
}

#Preview {
    CoreBeliefsList()
}
