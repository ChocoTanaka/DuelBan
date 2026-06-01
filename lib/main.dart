import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'Classfile.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 横向きに変更
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  WakelockPlus.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DuelBan',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DuelBan(title: 'Magic DuelBan'),
    );
  }
}

class DuelBan extends StatefulWidget {
  const DuelBan({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DuelBan> createState() => DuelBanRayOut();
}

class customClipper1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width,0);
    path.lineTo(size.width-30, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}

class customClipper2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(30, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width -30, size.height);
    path.lineTo(size.width , 0);

    path.close();

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}

class customClipper3 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(30, 0);
    path.lineTo(size.width , 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0,size.height);

    path.close();

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}


class DuelBanRayOut extends State<DuelBan> {



  @override
  void initState(){
  super.initState();
  }

  void Reset(){
    Players.forEach((Player p){
      p.lifenow = 20;
      p.lifes.clear();
    });

    setState(() {
    });
  }
  @override
  void dispose() {
    WakelockPlus.disable();

    super.dispose();
  }

  Widget PlayerView(Player p, BuildContext context){
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width : 3.0
          ),
          borderRadius: BorderRadius.circular(0),

        ),
      child:Column(
        children: <Widget>[
          Expanded(
            flex: 1,
              child: Text(
                p.Name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width : 2.0
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Players.indexOf(p) == 0 ? Colors.redAccent[700] : Colors.blueAccent[700]
                ),
                alignment: Alignment.center,
                child: Text(
                  p.lifenow.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                ),
              )
          ),
          Expanded(
              flex: 3,
              child: ListView.builder(
                  controller: p.controller,
                  reverse: true,
                  itemCount: p.lifes.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width : 1.0
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children:<Widget>[
                              const SizedBox(width: 10),
                              Text(
                                p.lifes[index].lifechange.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                            ]
                          ),
                          Text(
                            p.lifes[index].lifethen.toString(),
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.purple[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                            child: ClipPath(
                              clipper: customClipper1(),
                              child:ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      p.lifechange++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                    // 2. ボタンの内側・外側の余白を完全にゼロにする
                                    padding: EdgeInsets.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: Colors.green[400],
                                    minimumSize: const Size(0,0), // クリッパーの範囲に合うサイズを指定
                                  ),
                                  child: SizedBox(
                                    width: 140,
                                    child: Center(
                                     child:Text(
                                       '▲',
                                       style: TextStyle(
                                           fontSize: 24,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.black
                                       ),
                                     ),
                                    )
                                  )
                              ),
                            ),
                        ),
                    // 2. 中央のボタン (▼)
                    Positioned(
                      left: 100,
                      child: ClipPath(
                        clipper: customClipper2(),
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                p.lifechange--;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                              // 2. ボタンの内側・外側の余白を完全にゼロにする
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Colors.grey[500],
                              minimumSize: const Size(0,0),
                            ),
                            child: SizedBox(
                              width: 130,
                              child: Center(
                                child: Text(
                                  '▼',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              )
                            )
                        ),
                      ),
                    ),
                        Positioned(
                          left: 240,
                            child: Text(
                              p.lifechange.toString(),
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            ),
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: customClipper3(),
                    child:ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(p.lifechange != 0){
                            int then = p.lifenow + p.lifechange;
                            p.lifes.add(LifeLog(p.lifechange, then));
                            p.lifenow = then;
                            p.lifechange = 0;
                          }
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          print(p.controller.hasClients);
                          if (p.controller.hasClients) {
                            p.controller.jumpTo(p.controller.position.maxScrollExtent);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        // 2. ボタンの内側・外側の余白を完全にゼロにする
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.deepOrangeAccent[400],
                        minimumSize: const Size(0,0),
                      ),
                      child:  SizedBox(
                          width: 90,
                          child:Center(
                            child: Text(
                              '〇',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white
                              ),
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: (){
                Reset();
              },
              child: const Text(
                  'New Game',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                backgroundColor: Colors.green[300],
                side: BorderSide(
                  color: Colors.black, //枠線!
                  width: 1, //枠線！
                ),
                fixedSize: Size.fromWidth(double.maxFinite),
              ),
            ),
          ),
          Expanded(
              flex: 18,
              child: Row(
                children: <Widget>[
                  for(Player p in Players)
                    Expanded(
                        flex: 1,
                        child: PlayerView(p, context)
                    ),
                ],
              )
          )
        ],
      )
    );
  }
}
