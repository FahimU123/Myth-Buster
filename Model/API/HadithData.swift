//
//  HadithData.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 3/18/25.
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


//struct WaterWidgetView: View {
//    
//    // 2.
//    var entry: WaterProvider.Entry
//    
//    // 3.
//    var body: some View {
//        VStack(alignment: .leading){
//            HStack{
//                Image(systemName: "drop")
//                Text("Tip of the day")
//            }
//            .font(.title3)
//            .bold()
//            .padding(.bottom, 8)
//            
//            Text(entry.waterTip)
//                .font(.caption)
//            
//            Spacer()
//            
//            HStack{
//                Spacer()
//                Text("**Last Update:** \\(entry.date.formatted(.dateTime))")
//                    .font(.caption2)
//                
//            }
//        }
//        .foregroundStyle(.white)
//        
//        // 4.
//        .containerBackground(for: .widget){
//            Color.cyan
//        }
//    }
//}
