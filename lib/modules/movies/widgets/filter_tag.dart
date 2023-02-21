import 'package:app_movies/application/ui/theme_extensios.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(
        minWidth: 100,
        minHeight: 30,
      ),
      decoration: BoxDecoration(
        color: context.colorRed,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Infantil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
