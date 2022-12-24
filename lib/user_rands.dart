// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';


void shape() {
  print('╔══════════════════════════════════════════════════');
  print('║              GUESS THE NUMBER 2/2565             ');
  print('║──────────────────────────────────────────────────');
}

void main() {
  var game = Game();
  late GuessResult guessResult;
  shape();
  do {
    stdout.write('║  Guess the number between 1 and ${game.totalRandoms} : ');
    var input = stdin.readLineSync();
    if (input == null) {
      //print('Error, input is NULL');
      return;
    }
    var guess = int.tryParse(input);
    if (guess == null) {
      continue;
    }
    guessResult = game.doGuess(guess);

    if (guessResult == GuessResult.correct) {
      print('║  ➜ $guess is CORRECT ❤, total guesses: ${game.totalGuesses}');
      print('║──────────────────────────────────────────────────');
      print('║                    THE END                       ');
      print('╚══════════════════════════════════════════════════');
      while (true) {
        stdout.write('Play again? (Y/N):');
        var input = stdin.readLineSync();
        if (input == "y" || input == "Y") {
          guessResult = GuessResult.new_game;
          game.Gen_number();
          shape();
          break;
        } else if (input == "n" || input == "N") {
          guessResult = GuessResult.correct;
          break;
        }
      }
    } else if (guessResult == GuessResult.tooHigh) {
      print('║  ➜ $guess is TOO HIGH! ▲');
      print('║──────────────────────────────────────────────────');
    } else {
      print('║  ➜ $guess is TOO LOW! ▼');
      print('║──────────────────────────────────────────────────');
    }
  } while (guessResult != GuessResult.correct);
  print("\n\nYou've played ${Game.myList.length} games");
  for (var i = 1; i <= Game.myList.length; i++) {
    print("🚀 Game #$i: ${Game.myList[i - 1]} guesses");
  }
}
