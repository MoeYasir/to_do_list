import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold color
      backgroundColor: Colors.yellow[200],

      //App Bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        title: Text(
          "To Do",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          //functionality of Floating Action Button
          onPressed: () {}),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    //Container which has checkbox and Task text inside
                    Container(
                  height: 100,
                  width: 350,
                  //Container decoration
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        Text("Eat food")
                      ],
                    ),
                  ),
                )),
            //Container which has checkbox and Task text inside
            Container(
              height: 100,
              width: 350,
              //Container decoration
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    Text("Eat food")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Container which has checkbox and Task text inside
            Container(
              height: 100,
              width: 350,
              //Container decoration
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    Text("Eat food")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
