import 'package:app/modules/song_details/cubit/state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  static AppCubit get(context) => BlocProvider.of(context);

  void playSong() {
    audioPlayer.onPlayerStateChanged.listen(
      (state) {
        isPlaying = state == PlayerState.playing;
        emit(PlayChangedState());
      },
    );
    audioPlayer.onDurationChanged.listen(
      (newDuration) {
        duration = newDuration;
        emit(DurationState());
      },
    );
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      emit(PositionState());
    });
  }
}
