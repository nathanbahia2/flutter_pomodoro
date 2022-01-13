import 'dart:async';
import 'package:flutter/material.dart';

class TimerController {
  ValueNotifier<bool> isRunning = ValueNotifier(false);
  ValueNotifier<String> timeCounter = ValueNotifier("00:00");

  DateTime _timer = DateTime(2022, 1, 1, 0, 0, 0);
  late Timer _interval;

  String formatTimer() {
    String minutes = _timer.minute.toString();
    String seconds = _timer.second.toString();

    String adjustedMinutes = minutes.length == 1 ? '0' + minutes : minutes;
    String adjustedSeconds = seconds.length == 1 ? '0' + seconds : seconds;

    return "$adjustedMinutes:$adjustedSeconds";
  }

  void incrementTimer() {
    _timer = _timer.add(const Duration(seconds: 1));
    timeCounter.value = formatTimer();
  }

  void startTimer() async {
    isRunning.value = true;
    _interval =
        Timer.periodic(const Duration(seconds: 1), (t) => incrementTimer());
  }

  void stopTimer() {
    if (!isRunning.value) return;
    isRunning.value = false;
    timeCounter.value = "00:00";
    _interval.cancel();
    _timer = DateTime(2022, 1, 1, 0, 0, 0);
  }

  void pauseTimer() {
    if (!isRunning.value) return;
    isRunning.value = false;
    _interval.cancel();
  }

  void restartTimer() {
    if (timeCounter.value == "00:00") return;
    stopTimer();
    startTimer();
  }
}
