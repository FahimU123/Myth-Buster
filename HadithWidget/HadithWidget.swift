//
//  HadithWidget.swift
//  HadithWidget
//
//  Created by Fahim Uddin on 3/18/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), hadith: nil)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), hadith: nil)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            do {
      
                let hadith = try await APIManager.fetchRandomHadith()
                
                
                let entry = SimpleEntry(date: Date(), hadith: hadith)
                
                
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
                
               
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)
            } catch {
                
                print("Error fetching Hadith: \(error)")
                
                let entry = SimpleEntry(date: Date(), hadith: nil)
                
        
                let retryDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!
                let timeline = Timeline(entries: [entry], policy: .after(retryDate))
                completion(timeline)
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var hadith: HadithData?
}

struct HadithWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Random Hadith")
                .font(.headline)
            
            if let hadith = entry.hadith {
                Text(hadith.hadithEnglish)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text("No Hadith available")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
    }
}
    

struct HadithWidget: Widget {
    let kind: String = "HadithWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                HadithWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HadithWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    HadithWidget()
} timeline: {
    SimpleEntry(date: .now, hadith: nil )

}
