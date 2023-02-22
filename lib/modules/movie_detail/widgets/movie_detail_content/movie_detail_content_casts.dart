import 'package:app_movies/application/ui/theme_extensios.dart';
import 'package:app_movies/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'movie_cast.dart';

class MovieDetailContentCasts extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;

  MovieDetailContentCasts({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.colorGrey,
        ),
        Obx(
          () {
            return ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) {
                showPanel.toggle();
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: false,
                  backgroundColor: Colors.white,
                  isExpanded: showPanel.value,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: movie?.cast
                              .map(
                                (c) => MovieCast(
                                  cast: c,
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
