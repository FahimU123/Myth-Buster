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
        .frame(maxWidth: .infinity, alignment: .leading) 
        .background(Color.gray.opacity(0.1).cornerRadius(10.0))
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}


