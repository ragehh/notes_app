import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

import 'custom_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          CustomTextFormField(hint: 'Title'),
          SizedBox(height: 16),
          CustomTextFormField(hint: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
