import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = []
    @State private var newNoteTitle: String = ""
    @State private var newNoteContent: String = ""
    @State private var showEditNoteView = false
    @State private var selectedNote: Note?

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Title", text: $newNoteTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Content", text: $newNoteContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        guard !self.newNoteTitle.isEmpty, !self.newNoteContent.isEmpty else { return }
                        let note = Note(title: self.newNoteTitle, content: self.newNoteContent)
                        self.notes.append(note)
                        self.newNoteTitle = ""
                        self.newNoteContent = ""
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }

                List {
                    ForEach(notes) { note in
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.content)
                                .font(.subheadline)
                        }
                        .onTapGesture {
                            self.selectedNote = note
                            self.showEditNoteView = true
                        }
                    }
                    .onDelete { indexSet in
                        self.notes.remove(atOffsets: indexSet)
                    }
                }
            }
            .sheet(isPresented: $showEditNoteView) {
                if let selectedNote = self.selectedNote {
                    NoteDetailView(note: selectedNote, onSave: { updatedNote in
                        if let index = self.notes.firstIndex(where: { $0.id == updatedNote.id }) {
                            self.notes[index] = updatedNote
                        }
                        self.showEditNoteView = false
                    }, onDelete: {
                        if let index = self.notes.firstIndex(where: { $0.id == self.selectedNote?.id }) {
                            self.notes.remove(at: index)
                        }
                        self.showEditNoteView = false
                    })
                }
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct NoteDetailView: View {
    @State var note: Note
    var onSave: (Note) -> Void
    var onDelete: () -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $note.title)
                }

                Section(header: Text("Content")) {
                    TextField("Content", text: $note.content)
                }
            }
            .navigationBarTitle("Edit Note")
            .navigationBarItems(leading: Button("Delete") {
                self.onDelete()
            }
            .foregroundColor(.red), trailing: Button("Save") {
                self.onSave(self.note)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
