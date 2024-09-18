//
//  ContentView.swift
//  RecordatoriosApp
//
//  Created by Daniel Alejandro De Leon Ortega on 9/14/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)]
    ) var categories: FetchedResults<Category>

    @State private var showingAddCategory = false

    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: ReminderListView(category: category)) {
                        Text(category.name ?? "Sin nombre")
                    }
                }
            }
            .navigationTitle("Categorías")
            .navigationBarItems(trailing: Button(action: {
                showingAddCategory = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddCategory) {
                AddCategoryView().environment(\.managedObjectContext, viewContext)
            }
        }
    }
}

#Preview {
    ContentView()
}
