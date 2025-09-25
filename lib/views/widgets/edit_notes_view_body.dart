import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            color: kPrimaryColor,
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.content = content ?? widget.noteModel.content;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Text(
                    'Note edited successfully.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          CustomTextFormField(
            onChanged: (value) {
              title = value;
            },
            hint: 'Title',
            initialValue: widget.noteModel.title,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            onChanged: (value) {
              content = value;
            },
            hint: 'Content',
            initialValue: widget.noteModel.content,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          EditNoteColorsListView(noteModel: widget.noteModel),
        ],
      ),
    );
  }
}
