import 'package:app/modules/song_details/cubit/cubit.dart';
import 'package:app/modules/song_details/cubit/state.dart';
import 'package:app/shared/components.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongDetailsScreen extends StatelessWidget {
  String image = '';
  String audio = '';
  String title = '';
  String name = '';

  SongDetailsScreen(this.image, this.audio, this.title, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..playSong(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width * 0.07,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.069,
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(image),
                        radius: MediaQuery.of(context).size.width * 0.35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow_outlined,
                                      color: textColor.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                    defaultText(
                                      text: '36963 Plays',
                                      fontSize: 12.0,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultText(
                                  text: title,
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                defaultText(
                                  text: name,
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.downloading_outlined,
                              color: textColor,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Icon(
                              Icons.person_add_alt,
                              color: textColor,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      defaultText(
                        text: formatTime(
                          cubit.position,
                        ),
                      ),
                      Slider(
                        value: cubit.position.inSeconds.toDouble(),
                        min: 0,
                        max: cubit.duration.inSeconds.toDouble(),
                        label: cubit.position.toString(),
                        onChanged: (value) {
                          final position = Duration(
                            seconds: value.toInt(),
                          );
                          cubit.audioPlayer.seek(position).then((value) {});
                          cubit.audioPlayer.resume().then((value) {});
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Icon(
                            Icons.skip_previous_rounded,
                            color: Colors.white,
                            size: 50.0,
                          )),
                          Expanded(
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.pink,
                              child: IconButton(
                                alignment:AlignmentDirectional.center,
                                padding: EdgeInsetsDirectional.zero,
                                onPressed: () async {
                                  if (cubit.isPlaying) {
                                    await cubit.audioPlayer.pause();
                                  } else {
                                    await cubit.audioPlayer.play(
                                      AssetSource(
                                        audio,
                                      ),
                                    );
                                  }
                                },
                                icon: cubit.isPlaying
                                    ? const Icon(
                                        Icons.pause_rounded,
                                        size: 50.0,
                                      )
                                    : const Icon(
                                        Icons.play_arrow_rounded,
                                        size: 50.0,
                                      ),
                              ),
                            ),
                          ),
                           const Expanded(
                            child: Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.playlist_play_rounded,
                              color: textColor,
                              size: 30.0,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.loop_rounded,
                              color: textColor,
                              size: 30.0,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.shuffle_rounded,
                              color: textColor,
                              size: 30.0,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.playlist_add_rounded,
                              color: textColor,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join('/');
  }
}
