import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<NoteModel> allNotes;

  SearchCubit(this.allNotes) : super(SearchInitial());

  void search(String query) {
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      final results = allNotes
          .where(
            (note) =>
                note.title.toLowerCase().contains(query.toLowerCase()) ||
                note.content.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      emit(SearchResults(results));
    }
  }
}
