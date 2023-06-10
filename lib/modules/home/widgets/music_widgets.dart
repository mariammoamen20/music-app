import 'package:app/modules/song_details/song_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/music_model.dart';
import '../../../shared/components.dart';
import '../../../shared/styles/colors.dart';

Widget buildMusicItem(int index, context) {
  MusicModel musicModel = MusicModel();
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongDetailsScreen(
            musicModel.images[index],
          ),
        ),
      );
    },
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              child: Image.asset(
                musicModel.images[index],
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.grey,
                child: Icon(
                  musicModel.icons[index],
                  size: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        defaultText(
          text: musicModel.titles[index],
          fontSize: 12.0,
          color: Colors.white,
        ),
        defaultText(
          text: musicModel.artists[index],
          fontSize: 10.0,
          color: textColor,
        ),
      ],
    ),
  );
}
