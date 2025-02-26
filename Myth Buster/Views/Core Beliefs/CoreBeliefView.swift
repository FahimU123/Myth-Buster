//
//  CoreBelifsView.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 2/26/25.
//

import SwiftUI

struct CoreBeliefView: View {
    @State private var isExpanded = false
    let belief: CoreBelief

    var body: some View {
        GroupBox(label: Text(belief.title)) {
            VStack(alignment: .leading) {
                GroupBox {
                    Text(belief.shortDescription)
                }

                if isExpanded {
                    Text(belief.detailedDescription)
                        .transition(.move(edge: .bottom))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2).cornerRadius(10.0))
        }
        .overlay(alignment: .topTrailing) {
            Button(action: {
                withAnimation(.easeIn(duration: 0.3)) {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded ? "\(Image(systemName: "chevron.up.circle.fill"))" : "\(Image(systemName: "chevron.down.circle.fill"))")
                    .font(.caption)
                    .padding(8)
                    .background(Color.white.opacity(0.8).cornerRadius(8))
            }
            .padding(8)
        }
    }
}


