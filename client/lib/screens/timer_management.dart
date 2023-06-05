import 'dart:async';

class TimerManagement {
  Timer? songTimer;
  Duration songDuration = Duration.zero;
  Duration elapsedTime = Duration.zero;
  bool isNominationPeriod = false;
  bool isVotingPeriod = false;

  void startSongTimer() {
    songTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime += const Duration(seconds: 1);

      if (elapsedTime.inSeconds >= (songDuration.inSeconds / 2) &&
          elapsedTime.inSeconds < (songDuration.inSeconds * 3 / 4)) {
        isNominationPeriod = true;
        isVotingPeriod = false;
      } else if (elapsedTime.inSeconds >= (songDuration.inSeconds * 3 / 4)) {
        isNominationPeriod = false;
        isVotingPeriod = true;
      } else if (elapsedTime >= songDuration) {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    elapsedTime = Duration.zero;
    songTimer?.cancel();
    startSongTimer();
  }

  void dispose() {
    songTimer?.cancel();
  }
}
