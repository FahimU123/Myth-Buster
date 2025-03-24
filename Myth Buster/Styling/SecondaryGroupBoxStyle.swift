//
//  SecondaryGroupBoxStyle.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/7/25.
//

import SwiftUI

struct SecondaryGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .padding()
        .background(Color(.blue))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
