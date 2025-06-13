class LifeLog{
  int lifechange = 0;

  late int lifethen;

  LifeLog(int change, int then){
    this.lifechange = change;
    this.lifethen = then;
  }
}

class Player{
  late String Name;
  int lifenow = 20;

  int lifechange =0;

  List<LifeLog> lifes = [];

  Player( String name){
    this.Name = name;
  }
}

List<Player> Players = [Player('Player1'), Player('Player2')];
