import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:isarcrud/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  final List<Note> currentNotes = [];

  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser.trim();
    await isar.writeTxn(() => isar.notes.put(newNote));
    await fetchNotes();
  }

  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText.trim();
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
