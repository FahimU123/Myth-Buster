//
//  CoreBelifsView.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 2/26/25.
//

import SwiftUI

struct CoreBeliefView: View {
    let belief: CoreBelief
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(belief.title)
                .font(.headline)
                .fontWeight(.bold)

            Text(belief.shortDescription)
                .font(.body)
                .padding(.vertical, 4)

            if isExpanded {
                Text(belief.detailedDescription)
                    .font(.body)
                    .padding(.top, 8)
                    .transition(.move(edge: .bottom))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // Align content to leading edge
        .background(Color.gray.opacity(0.1).cornerRadius(10.0))
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}

#Preview {
    CoreBeliefView(belief: CoreBelief(
        title: "Belief in God (Allah)",
        shortDescription: "Belief in the one and only God, Allah.",
        detailedDescription: "In Islam, the belief in God is the cornerstone of faith. This entails believing in one God, Allah, who is unique, without partners or equals. He is the Creator and Sustainer of the universe, all-knowing, all-powerful, and merciful..."
    ))
}
