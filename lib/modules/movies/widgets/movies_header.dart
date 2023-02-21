import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_movies/application/ui/theme_extensios.dart';

class MoviesHeader extends StatelessWidget {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            width: Get.width * .9,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Procurar filmes',
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: context.colorGrey,
                ),
                prefixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
