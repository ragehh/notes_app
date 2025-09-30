import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/search_view_body.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../cubits/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, notesState) {
        List<NoteModel> allNotes = [];
        if (notesState is NotesSuccess) {
          allNotes = notesState.notes;
        }

        return BlocProvider(
          create: (context) => SearchCubit(allNotes),
          child: Builder(
            builder: (context) {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(title: const Text("Search Notes")),
                  body: SearchViewBody(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
