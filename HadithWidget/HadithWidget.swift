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
            
            guard let hadith = try? await APIManager.fetchRandomHadith() else {
                return
            }
            
            
            let entry = SimpleEntry(date: Date(), hadith: hadith)
            
            
            let nextUpdate = Calendar.current.date(
                byAdding: DateComponents(minute: 1),
                to: Date()
            )!
            
            let timeline = Timeline(
                entries: [entry],
                policy: .after(nextUpdate)
            )
            
            completion(timeline)
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
            
        VStack(alignment: .leading) {
            
            if let hadith = entry.hadith {
                VStack(alignment: .leading) {
                    Text("Hadith Strength: \(hadith.status)")
                        .font(.system(size: 8, weight: .light))
                        .foregroundColor(.blue)
                    
                    Text(hadith.hadithEnglish)
                        .font(.system(size: 8, weight: .light))
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1)))
            } else {
                Text("No Hadith available")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
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
