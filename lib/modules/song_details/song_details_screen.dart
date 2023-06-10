import 'package:app/shared/components.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongDetailsScreen extends StatefulWidget {
  String image = '';

  SongDetailsScreen(this.image, {super.key});

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen(
      (state) {
        setState(
          () {
            isPlaying = state == PlayerState.playing;
          },
        );
      },
    );
    audioPlayer.onDurationChanged.listen(
      (newDuration) {
        setState(
          () {
            duration = newDuration;
          },
        );
      },
    );
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      width: 10.0,
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
                  backgroundImage: AssetImage(widget.image),
                  radius: MediaQuery.of(context).size.width * 0.35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
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
                            text: 'Dele Divoneh',
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          defaultText(
                            text: 'Ahlam',
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
                        Icons.favorite_border,
                        color: textColor,
                      ),
                    ],
                  ),
                ),
                defaultText(
                  text: formatTime(
                    position,
                  ),
                ),
                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  label: position.toString(),
                  thumbColor: textColor,
                  onChanged: (value) async {
                    final position = Duration(
                      seconds: value.toInt(),
                    );
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Icon(
                      Icons.skip_previous_outlined,
                      color: Colors.white,
                      size: 50.0,
                    )),
                    Expanded(
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.pink,
                        child: IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            } else {
                              await audioPlayer.play(
                                AssetSource(
                                  'audio/audio.mp3',
                                ),
                              );
                            }
                          },
                          icon: isPlaying
                              ? const Icon(
                                  Icons.pause,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.skip_next_outlined,
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
                        Icons.menu,
                        color: textColor,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.loop,
                        color: textColor,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.shuffle,
                        color: textColor,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.menu,
                        color: textColor,
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
