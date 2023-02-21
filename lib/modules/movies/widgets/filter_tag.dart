// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_movies/application/ui/theme_extensios.dart';
import 'package:app_movies/models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool _selected;
  final VoidCallback onPressed;
  const FilterTag({
    Key? key,
    required this.model,
    bool selected = false,
    required this.onPressed,
  })  : _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(left: 12, right: 12),
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 30,
        ),
        decoration: BoxDecoration(
          color: _selected ? context.colorRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
