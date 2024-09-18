//
//  AddReminderView.swift
//  RecordatoriosApp
//
//  Created by Daniel Alejandro De Leon Ortega on 9/14/24.
//

import SwiftUI
import UserNotifications

struct AddReminderView: View {
    @ObservedObject var category: Category
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var date = Date()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Título del recordatorio", text: $title)
                DatePicker("Fecha y hora", selection: $date)
            }
            .navigationTitle("Nuevo Recordatorio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        addReminder()
                        dismiss()
                    }
                }
            }
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }


    private func addReminder() {
        let newReminder = Reminder(context: viewContext)
        newReminder.id = UUID()
        newReminder.title = title
        newReminder.date = date
        newReminder.category = category

        do {
            try viewContext.save()
            sendEmail(subject: "Recordatorio: \(title)",
                      body: "Tienes un recordatorio programado para el \(formattedDate(date)) en la categoría \(category.name ?? "Sin nombre").",
                      sendTime: date)
        } catch {
            print("Error al guardar recordatorio: \(error.localizedDescription)")
        }
    }


    private func scheduleNotification(for reminder: Reminder) {
        let content = UNMutableNotificationContent()
        content.title = reminder.title ?? "Recordatorio"
        content.body = "En la categoría \(reminder.category?.name ?? "Sin categoría")"
        content.sound = .default
        content.userInfo = ["categoryID": reminder.category?.id?.uuidString ?? "", "reminderID": reminder.id?.uuidString ?? ""]

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date ?? Date())
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let request = UNNotificationRequest(identifier: reminder.id?.uuidString ?? UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al programar notificación: \(error.localizedDescription)")
            } else {
                print("Notificación programada para \(reminder.date!)")
            }
        }
    }
}
