import 'dart:core';

import 'package:tennis_game/tennis_game.dart';

class TennisGame1 implements TennisGame {
  int firstPlayerScore = 0;
  int secondPlayerScore = 0;
  String firstPlayerName;
  String secondPlayerName;

  TennisGame1(this.firstPlayerName, this.secondPlayerName);

  @override
  void wonPoint(String playerName) {
    if (playerName == "player1") {
      firstPlayerScore += 1;
    } else {
      secondPlayerScore += 1;
    }
  }

  // first case ==
  // second case Love-Fifteen
  //

  @override
  String getScore() {
    String gameScore = "";
    int tempScore = 0;
    if (firstPlayerScore == secondPlayerScore) {
      gameScore = checkGameScoreWhenPlayersEqual(firstPlayerScore);
    } else if (firstPlayerScore >= 4 || secondPlayerScore >= 4) {
      int minusResult = firstPlayerScore - secondPlayerScore;
      if (minusResult == 1)
        gameScore = "Advantage player1";
      else if (minusResult == -1)
        gameScore = "Advantage player2";
      else if (minusResult >= 2)
        gameScore = "Win for player1";
      else
        gameScore = "Win for player2";
    } else {
      for (int i = 1; i < 3; i++) {
        if (i == 1)
          tempScore = firstPlayerScore;
        else {
          gameScore += "-";
          tempScore = secondPlayerScore;
        }
        switch (tempScore) {
          case 0:
            gameScore += "Love";
            break;
          case 1:
            gameScore += "Fifteen";
            break;
          case 2:
            gameScore += "Thirty";
            break;
          case 3:
            gameScore += "Forty";
            break;
        }
      }
    }
    return gameScore;
  }

  String checkGameScoreWhenPlayersEqual(int score) {
    String resultText = '';
    switch (firstPlayerScore) {
      case 0:
        resultText = "Love-All";
        break;
      case 1:
        resultText = "Fifteen-All";
        break;
      case 2:
        resultText = "Thirty-All";
        break;
      default:
        resultText = "Deuce";
        break;
    }
    return resultText;
  }
}
