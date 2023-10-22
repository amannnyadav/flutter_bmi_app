import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key,key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtcontroller= TextEditingController();
  var htinchcontroller=TextEditingController();
  var htfeetcontroller= TextEditingController();

  var result ="";
  var bgcolor=Colors.teal.shade50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.tealAccent.shade700,
        title: Text('Flutter BMI App'),
      ),
      body: Container(
        color: bgcolor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: wtcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Weignt(in Kg)'),
                  prefixIcon: Icon(Icons.line_weight),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal.shade700,
                        width: 2,
                      ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: htfeetcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your height(in feet)'),
                  prefixIcon: Icon(Icons.height),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal.shade700,
                        width: 2,
                      ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: htinchcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your hHeight(in inch)'),
                  prefixIcon: Icon(Icons.height),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal.shade700,
                        width: 2,
                      ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular(25)),
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              var wt= wtcontroller.text.toString();
              var htft= htfeetcontroller.text.toString();
              var htinch= htinchcontroller.text.toString();

              if(wt!="" && htft!="" && htinch!=""){

                var iwt = int.parse(wt);
                var ihtft=int.parse(htft);
                var ihtinch=int.parse(htinch);

                var tinch= (ihtft*12) + ihtinch;
                var tCm= tinch*2.54;
                var tM= tCm/100;
                var bmi= iwt/(tM*tM);
                var msg="";
                if(bmi>25){
                  msg="You're OverWeight";
                  bgcolor=Colors.orange.shade400;
                }else if(bmi<18){
                  msg="You're UnderWeight";
                  bgcolor=Colors.red.shade400;
                }else{
                  msg="You're Healthy!!!";
                  bgcolor=Colors.greenAccent.shade400;
                }
                result="$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                setState(() {
                  
                });
              }else{
                setState(() {
                  result= "Please fill all three fields";
                });
              }
            },child: Text('Calculate')),
            Text(result),
          ],
        ),
      ),
    );
  }
}
