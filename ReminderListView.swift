//
//  ReminderListView.swift
//  RecordatoriosApp
//
//  Created by Daniel Alejandro De Leon Ortega on 9/14/24.
//

import Foundation
import SwiftUI
import CoreData

struct ReminderListView: View {
    @ObservedObject var category: Category
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest var reminders: FetchedResults<Reminder>
    @State private var showingAddReminder = false

    init(category: Category) {
        self.category = category
        _reminders = FetchRequest<Reminder>(
            entity: Reminder.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.date, ascending: true)],
            predicate: NSPredicate(format: "category == %@", category)
        )
    }

    var body: some View {
        List {
            ForEach(reminders) { reminder in
                Text(reminder.title ?? "Sin título")
            }
        }
        .navigationTitle(category.name ?? "Recordatorios")
        .navigationBarItems(trailing: Button(action: {
            showingAddReminder = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddReminder) {
            AddReminderView(category: category).environment(\.managedObjectContext, viewContext)
        }
    }
}
