import 'package:flutter/widgets.dart';

enum players{
  Player1("Player1"),
  Player2("Player2");

  final String label;

  const players(this.label);
}

class LifeLog{

  late players p;

  int lifechange = 0;

  late int lifethen;

  LifeLog(int change, int then, players _p){
    this.lifechange = change;
    this.lifethen = then;
    this.p = _p;
  }
}

class Player{
  late players pnum;
  int lifenow = 20;

  int lifechange =0;

  Player(players _p){
    this.pnum = _p;
  }

  bool isp1(){
    return this.pnum == players.Player1 ? true : false ;
  }
}

final ScrollController controller = ScrollController();

List<Player> Players = [Player(players.Player1), Player(players.Player2)];

List<LifeLog> lifes = [];
