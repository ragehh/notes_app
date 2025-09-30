import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.allNotes) : super(SearchInitial());

  final List<NoteModel> allNotes;

  void search(String query) {
    if (query.isEmpty) {
      emit(SearchResults(allNotes));
    } else {
      final filtered = allNotes.where((note) {
        final q = query.toLowerCase();
        return note.title.toLowerCase().contains(q) ||
            note.content.toLowerCase().contains(q);
      }).toList();

      emit(SearchResults(filtered));
    }
  }
}
