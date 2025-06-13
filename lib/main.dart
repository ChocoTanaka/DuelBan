import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Classfile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 横向きに変更
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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

class DuelBanRayOut extends State<DuelBan> {

  void Reset(){
    Players.forEach((Player p){
      p.lifenow = 20;
      p.lifes.clear();
    });

    setState(() {
    });
  }

  Widget PlayerView(Player p, BuildContext context){
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
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
                      color: Colors.blue,
                      width : 2.0
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  p.lifenow.toString(),
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          ),
          Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: p.lifes.length,
                  itemBuilder: (context, index){
                    return Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
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
                                fontSize: 24,
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
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Text(
                        p.lifechange.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            p.lifechange--;
                          });
                        },
                        child: const Text(
                          '▼',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          backgroundColor: Colors.teal[50],
                          //fixedSize: Size(double.infinity, 10),
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            p.lifechange++;
                          });
                        },
                        child: const Text(
                          '▲',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          backgroundColor: Colors.teal[50],
                          //fixedSize: Size(double.infinity, 10),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(p.lifechange != 0){
                              int then = p.lifenow + p.lifechange;
                              p.lifes.add(LifeLog(p.lifechange, then));
                              p.lifenow = then;
                              p.lifechange = 0;
                            }
                          });
                        },
                        child: const Text(
                          '〇',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.deepOrange[100],
                        ),
                      )
                    ],
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
