import SwiftUI

struct AddCategoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre de la categoría", text: $name)
            }
            .navigationTitle("Nueva Categoría")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        addCategory()
                        dismiss()
                    }
                }
            }
        }
    }

    private func addCategory() {
        let newCategory = Category(context: viewContext)
        newCategory.id = UUID()
        newCategory.name = name

        do {
            try viewContext.save()
        } catch {
            print("Error al guardar categoría: \(error.localizedDescription)")
        }
    }
}
