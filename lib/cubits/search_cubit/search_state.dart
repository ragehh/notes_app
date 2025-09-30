part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchResults extends SearchState {
  final List<NoteModel> notes;

  SearchResults(this.notes);
}
