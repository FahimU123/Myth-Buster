//
//  HadithWidget.swift
//  HadithWidget
//
//  Created by Fahim Uddin on 3/17/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let apiFetch = ApiFetch()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), name: "swiftui", book: "s", link: "s", linkmini: "s")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry =  SimpleEntry(date: Date(), name: "swiftui", book: "s", link: "s", linkmini: "s")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry =  SimpleEntry(date: Date(), name: "swiftui", book: "s", link: "s", linkmini: "s")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let hadith: Had

struct HadithWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.name)
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
    SimpleEntry(date: .now, name: "s", book: "s", link: "s", linkmini: "s")

}
