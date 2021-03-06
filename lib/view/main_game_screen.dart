import 'package:flutter/material.dart';
import 'package:maru_batu_game/model/player_type.dart';
import 'package:maru_batu_game/store/first_player.dart';
import 'package:maru_batu_game/store/second_player.dart';
import 'package:maru_batu_game/store/trout_table.dart';
import 'package:maru_batu_game/store/turn.dart';

class MainGameScreen extends StatefulWidget {
  _MainGameScreenState createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  @override
  Widget build(BuildContext context) {
    Turn.init(() {
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        leading: Opacity(opacity: 0),
        centerTitle: true,
        title: RotatedBox(
          quarterTurns: 2,
          child: Text(Turn.current() == PlayerType.Second ? 'あなたのターン' : '',style: TextStyle(fontSize: 30),),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              Turn.current() == PlayerType.First ? 'あなたのターン' : '',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: SecondPlayer.hasPiecesWidget(),
                  ),
                ),
                TroutTable.asWidget(context),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: FirstPlayer.hasPiecesWidget(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
