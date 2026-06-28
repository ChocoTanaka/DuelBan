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

class customClipper1R extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width,0);
    path.lineTo(size.width-25, size.height);
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



class customClipper2R extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(25, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width-25 , 0);

    path.close();

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}

class customClipper1L extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width,0);
    path.lineTo(size.width, size.height);
    path.lineTo(25, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}



class customClipper2L extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(25, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width-25, 0);

    path.close();

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}

class customClipper3R extends CustomClipper<Path> {
@override
getClip(Size size) {
  var path = Path();

  path.moveTo(0, 0);
  path.lineTo(size.width-25, 0);
  path.lineTo(size.width, size.height / 2);
  path.lineTo(size.width-25, size.height);
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

class customClipper3L extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(25, 0);
    path.lineTo(size.width , 0);
    path.lineTo(size.width, size.height);
    path.lineTo(25,size.height);
    path.lineTo(0, size.height / 2);

    path.close();

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // clipperが変わらない場合はfalse、変わる場合はtrue
    return false;
  }
}

class customClipper_t extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width , 0);
    path.lineTo(size.width * 3 /4, size.height);
    path.lineTo(size.width * 1 /4, size.height);
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
      p.lifechange =0;
    });
    lifes.clear();
    setState(() {
    });
  }
  @override
  void dispose() {
    WakelockPlus.disable();

    super.dispose();
  }

  Widget Buttonview1(Player p,double width, double height){
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: ClipPath(
              clipper: customClipper1L() ,
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
                      width: width/2,
                      height: height,
                      child: Container(
                        alignment: Alignment(0.5,0),
                        child:Text(
                          '▲',
                          style: TextStyle(
                              fontSize: height*0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              ),
            ),
          ),
          // 2. 中央のボタン (▼)
          Positioned(
            right: width/2 -25,
            child: ClipPath(
              clipper: customClipper2L(),
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
                    backgroundColor: Colors.grey[700],
                    minimumSize: const Size(0,0),
                  ),
                  child: SizedBox(
                      width: width/2 +25,
                      height: height,
                      child: Center(
                        child: Text(
                          '▼',
                          style: TextStyle(
                              fontSize: height*0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Buttonview2(Player p,double width, double height){
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: ClipPath(
              clipper: customClipper1R() ,
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
                      width: width/2,
                      height: height,
                      child: Container(
                        alignment: Alignment(-0.5,0),
                        child:Text(
                          '▲',
                          style: TextStyle(
                              fontSize: height*0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              ),
            ),
          ),
          // 2. 中央のボタン (▼)
          Positioned(
            left: width/2 -25,
            child: ClipPath(
              clipper: customClipper2R(),
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
                    backgroundColor: Colors.grey[700],
                    minimumSize: const Size(0,0),
                  ),
                  child: SizedBox(
                      width: width/2 +25,
                      height: height,
                      child: Center(
                        child: Text(
                          '▼',
                          style: TextStyle(
                              fontSize: height*0.7,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget PlayerView2(Player p, BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentHeight = constraints.maxHeight;
        final parentWidth = constraints.maxWidth;
        return Stack(
          children: [
            //base
            Align(
              alignment: Alignment.center,
                child: Container(
                  width: parentWidth,
                  height : parentHeight,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width : 2.0
                      ),
                      borderRadius: BorderRadius.circular(0),
                      color: p.isp1() ? Colors.red[100] : Colors.blue[100]
                  ),
                  alignment: p.isp1() ? Alignment(5/6, -3/4) : Alignment(-5/6, -3/4),
                  //lifenow
                  child : Container(
                    width: parentWidth * 3/5,
                    height: parentHeight * 3/4,
                    alignment: Alignment.center,
                    color: p.isp1() ? Colors.redAccent[700] : Colors.blueAccent[700],
                    child: Text(
                        (p.lifenow + p.lifechange).toString(),
                      style: TextStyle(
                        fontSize: parentHeight * 3/4 * 0.8,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),

                )
            ),
            //p_name
            Align(
                alignment: p.isp1() ? Alignment.topLeft : Alignment.topRight,
                child: Container(
                  width : parentWidth * 1/2,
                  height: parentHeight * (1 / 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width : 2.0
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    p.pnum.label,
                    style: TextStyle(
                      fontSize: parentHeight * 1/5 *0.6,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            Positioned(
                bottom: 2,
                right: 2,
                left: 2,
              child: p.isp1() ? Buttonview1(p,parentWidth *(2/3), parentHeight * (1 / 6)) : Buttonview2(p,parentWidth *(2/3),parentHeight * (1 / 6))
            ),
            //差分
            Align(
                alignment: p.isp1() ? Alignment(-3/4, -1/6) : Alignment(3/4, -1/6),
              child: Text(
                p.lifechange.toString(),
                style: TextStyle(
                    fontSize: parentHeight * 1/5 *0.8,
                    fontWeight: FontWeight.w500,
                    color: p.lifechange <0 ? Colors.grey : Colors.white,
                ),
              ),
            ),
            //決定
            Positioned(
              bottom: 2,
                right: 2,
                left: 2,
              child: SizedBox(
                height: parentHeight * (1/3),
                child: Align(
                  alignment: p.isp1() ? Alignment.centerLeft : Alignment.centerRight,
                    child: ClipPath(
                      clipper: p.isp1() ? customClipper3R() : customClipper3L(),
                      child:ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(p.lifechange != 0){
                              int then = p.lifenow + p.lifechange;
                              lifes.add(LifeLog(p.lifechange, then, p.pnum));
                              p.lifenow = then;
                              p.lifechange = 0;
                            }
                          });
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            print(controller.hasClients);
                            if (controller.hasClients) {
                              controller.jumpTo(controller.position.maxScrollExtent);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          // 2. ボタンの内側・外側の余白を完全にゼロにする
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: Colors.orange[700],
                          minimumSize: const Size(0,0),
                        ),
                        child:  SizedBox(
                            width: parentWidth * (1/3) +25,
                            height: parentHeight * (1/3),
                            child:Container(
                              alignment: p.isp1() ? Alignment(-0.5,0) : Alignment(0.5 , 0),
                              child: Text(
                                '〇',
                                style: TextStyle(
                                    fontSize: parentHeight * (1/4) *0.7,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      ),
                    )
                ),
              ),
            )
          ]
        ) ;
      }
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          //main画面
          Expanded(
              flex: 12,
              child: LayoutBuilder(
                  builder: (context, constraints) {
                    final parentHeight = constraints.maxHeight;
                    final parentWidth = constraints.maxWidth;
                    return Stack(
                      children: [
                        Row(
                          children: [
                            for(Player p in Players)
                              Expanded(
                                  flex: 1,
                                  child: PlayerView2(p, context)
                              ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ClipPath(
                              clipper: customClipper_t(),
                              child: ElevatedButton(
                                onPressed: (){
                                  Reset();
                                },
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  width : parentWidth * 1/6,
                                  height : parentHeight * 1/4,
                                  child: Text(
                                    'New\nGame',
                                    style: TextStyle(
                                        fontSize: parentHeight * 1/6 * 0.5,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)
                                  ),
                                  backgroundColor: Colors.lightGreenAccent[100],
                                ),
                              ),
                          ),
                        )
                      ],
                    );
                  }
              ),
          ),
          //棋譜
          Expanded(
              flex: 8,
              child: ListView.builder(
                  controller: controller,
                  itemCount: lifes.length + 1,
                  itemBuilder: (context, index){
                    // 最初の要素（indexが0）の場合
                    if (index == 0) {
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
                            children: [
                              Text(
                                "20",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                "20",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          )
                      );
                    }

                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width : 1.0
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: lifes[index-1].p == players.Player1 ? MainAxisAlignment.start : MainAxisAlignment.end,
                          children:<Widget>[
                            Text(
                              lifes[index-1].p == players.Player1 ?
                              lifes[index-1].lifethen.toString() + "  (${lifes[index-1].lifechange.toString()})" :
                              "(${lifes[index-1].lifechange.toString()})  " + lifes[index-1].lifethen.toString(),
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                          ]
                      ),
                    );
                  }
              )
          ),


        ],
      )
    );
  }
}
