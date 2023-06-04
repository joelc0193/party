import 'dart:async';

class TimerManagement {
  Timer? songTimer;
  Duration songDuration = Duration.zero;
  Duration elapsedTime = Duration.zero;

  void startSongTimer() {
    songTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      elapsedTime += Duration(seconds: 1);
    });
  }

  void dispose() {
    songTimer?.cancel();
  }
}
