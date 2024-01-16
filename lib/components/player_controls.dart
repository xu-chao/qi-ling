import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';

import '../main.dart';

class PlayerControls extends StatefulWidget {
  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls>
    with TickerProviderStateMixin {
  late AnimationController iconAnimController;
  late bool isPlaying;
  late bool isShuffle;
  late bool isBoostAudio;
  late double sliderValue;

  FlutterSoundPlayer? _player;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
    iconAnimController = AnimationController(vsync: this, duration: fast);
    sliderValue = 0;
    isShuffle = false;
    isBoostAudio = false;
  }

  // This function displays SeekBar
  Future<Widget> seekBar(
      {required double thumbRadius, required double overlayRadius, required double trackHeight}) async {
    await Future.delayed(fast);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
        overlayShape: RoundSliderOverlayShape(overlayRadius: overlayRadius),
        trackHeight: trackHeight,
        inactiveTrackColor: Colors.grey[300],
      ),
      child: Slider(
        value: sliderValue,
        onChanged: (double value) {
          setState(() {
            sliderValue = value;
          });
        },
        min: 0,
        max: 1,
      ),
    );
  }

  // This Function removes Seek Bar
  Future<Widget> removeSeekBar() async {
    // await Future.delayed(superFast);
    return Container(height: 0, width: 0);
  }

  /// 播放白噪音
  void startPlayer() async {
    isPlaying = true;
    final filePath = await rootBundle.load('assets/sounds/rainy.mp3');
    if (_player != null) {
      await _player?.stopPlayer();
      await _player?.closePlayer();
    }
    _player = FlutterSoundPlayer();
    await _player?.openPlayer();
    _player?.startPlayer(
        fromDataBuffer: filePath.buffer.asUint8List(),
        whenFinished: () {
          _player?.closePlayer();
          _player = null;
          Timer(const Duration(milliseconds: 500), () {
            if (isPlaying) {
              startPlayer();
            }
          });
        });
  }

  /// 停止播放白噪音
  void stopPlayer() async {
    isPlaying = false;
    if (_player?.isPlaying == true) {
      await _player?.stopPlayer();
    }
    _player?.closePlayer();
    _player = null;
  }

  Widget shuffleIcon(double iconSize) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShuffle = isShuffle ? false : true;
        });
      },
      child: Icon(
        IconData(0xe80c, fontFamily: 'AppIcons'),
        size: iconSize,
        color: isShuffle ? Colors.blue : Colors.grey[600],
      ),
    );
  }

  Widget boostAudioIcon(double iconSize) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoostAudio = isBoostAudio ? false : true;
        });
      },
      child: Icon(
        IconData(0xe804, fontFamily: 'AppIcons'),
        size: iconSize,
        color: isBoostAudio ? Colors.blue : Colors.grey[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Parent Structure for PlayerControls
      duration: normal,
      height: leftActive ? rCollapsed : lExpanded,
      width: leftActive ? lExpanded : lCollapsed,
      padding: leftActive
          ? EdgeInsets.symmetric(
              horizontal: 40,
            )
          : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AnimatedContainer(
            duration: normal,
            height: leftActive ? 0 : 10,
          ),
          AnimatedContainer(
            duration: normal,
            height: leftActive ? 0 : 20,
            width: leftActive ? 0 : 20,
            child: AnimatedOpacity(
              duration: fast,
              opacity: leftActive ? 0 : 1,
              child: shuffleIcon(leftActive ? 0 : 15),
            ),
          ),
          AnimatedContainer(
            duration: normal,
            height: leftActive ? 0 : 20,
            width: leftActive ? 0 : 20,
            child: AnimatedOpacity(
              duration: fast,
              opacity: leftActive ? 0 : 1,
              child: boostAudioIcon(leftActive ? 0 : 15),
            ),
          ),
          AnimatedContainer(
            // SeekBar
            duration: normal,
            height: leftActive ? 0 : 100,
            width: leftActive ? 0 : 120,
            child: FutureBuilder(
              initialData: Container(width: 0.0, height: 0.0),
              future: leftActive
                  ? removeSeekBar()
                  : seekBar(
                      thumbRadius: leftActive ? 0 : 5,
                      overlayRadius: leftActive ? 10 : 0,
                      trackHeight: leftActive ? 0 : 2,
                    ),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Transform.rotate(
                  angle: -pi / 2,
                  child: snapshot.data,
                );
              },
            ),
          ),
          Container(
            height: rCollapsed,
            child: Row(
              mainAxisAlignment: leftActive
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // Play/Pause Icon
                  alignment: Alignment.center, height: rCollapsed - 40,
                  width: rCollapsed - 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      isPlaying ? iconAnimController.reverse() : iconAnimController.forward();
                      isPlaying = isPlaying ? false : true;
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconAnimController,
                    ),
                  ),
                ),
                AnimatedContainer(
                  // SeekBar
                  duration: normal,
                  height: leftActive ? 100 : 0,
                  width: leftActive ? 120 : 0,
                  child: FutureBuilder(
                    initialData: Container(width: 0.0, height: 0.0),
                    future: leftActive
                        ? seekBar(
                            thumbRadius: leftActive ? 5 : 0,
                            overlayRadius: leftActive ? 10 : 0,
                            trackHeight: leftActive ? 2 : 0,
                          )
                        : removeSeekBar(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.data;
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: normal,
                  height: leftActive ? 20 : 0,
                  width: leftActive ? 20 : 0,
                  child: AnimatedOpacity(
                    duration: fast,
                    opacity: leftActive ? 1 : 0,
                    child: boostAudioIcon(leftActive ? 15 : 0),
                  ),
                ),
                AnimatedContainer(
                  duration: normal,
                  height: leftActive ? 20 : 0,
                  width: leftActive ? 20 : 0,
                  child: AnimatedOpacity(
                    duration: fast,
                    opacity: leftActive ? 1 : 0,
                    child: shuffleIcon(leftActive ? 15 : 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
