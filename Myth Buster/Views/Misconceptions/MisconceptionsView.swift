//
//  Misconceptions.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 2/26/25.
//

import SwiftUI

struct MisconceptionsView: View {
    @State private var selectedTopic: Misconception = .jihad
    var body: some View {
        VStack(alignment: .leading) {
            
            
            Picker("Select a topic", selection: $selectedTopic) {
                ForEach(Misconception.allCases, id: \.self) { topic in
                    Text(topic.rawValue)
                }
                
            }
            .pickerStyle(.menu)
            .accentColor(.black)
            .background(RoundedRectangle(cornerRadius:15)
                .fill(.orange))
            .padding()
            
            Text(selectedTopic.content)
                .font(.custom("Avenir", size: 15))
            
        }
    }
}

#Preview {
    MisconceptionsView()
}
