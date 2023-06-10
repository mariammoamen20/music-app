import 'package:app/modules/song_details/cubit/state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void playSong(){
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      emit(PlayChangedState());
    });
  }
}