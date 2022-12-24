// ignore_for_file: avoid_print

import 'dart:math';

// enumeration
enum GuessResult { correct, tooHigh, tooLow, new_game }

class Game {
  int ran = Random().nextInt(100) + 1;
  late int answer = Random().nextInt(ran) + 1;
  int _totalGuesses = 0;
  static List myList = <int>[];
  // constructor
  Game() {
    print('Enter a maximum number to random : $ran');
  }
  void Gen_number() {
    this.ran = Random().nextInt(100) + 1;
    this.answer = Random().nextInt(ran) + 1;
    this._totalGuesses = 0;
    print("");
    print('Enter a maximum number to random : $ran');
  }
  GuessResult doGuess(int guess) {
    _totalGuesses++;
    if (guess == answer) {
      return GuessResult.correct;
    } else if (guess > answer) {
      return GuessResult.tooHigh;
    } else {
      return GuessResult.tooLow;
    }
  }
  // getter
  int get totalGuesses {
    myList.add(_totalGuesses);
    return _totalGuesses;
  }
}
