import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo_game/HomePage.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  @override
  String name1 ="Player 1";
  String name2 ="Player 2";
  final TextEditingController textEditingController1 = TextEditingController();
  String? player1Choice = "X";
  String? player2Choice = "O";
  final TextEditingController textEditingController2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/15,),
            Image.asset("images/last__1_-removebg-preview.png",scale: 2,),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Players Enter There Names ", style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.length < 1) {
                          return "Player 1 name must be more than 1 characters";
                        }
                      },
                      controller: textEditingController1,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          filled: true,
                          fillColor:  Colors.indigo[700],
                          labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                          labelText: "Player 1",
                          prefixIcon: Icon(
                            Icons.person,
                            size: 28,
                            color:Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.length < 1) {
                          return "Player 2 name must be more than 1 characters";
                        }
                      },
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      controller: textEditingController2,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          filled: true,
                          fillColor:  Colors.indigo[700],
                          labelText: "Player 2",
                          labelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 28,
                            color:  Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Player 1: ${player1Choice ?? 'Not selected'}',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 10),
                    RadioListTile<String>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text('X',style: GoogleFonts.montserrat(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                      value: 'X',
                      groupValue: player1Choice,
                      onChanged: (value) {
                        setState(() {
                          player1Choice = value;
                          player2Choice = value == 'X' ? 'O' : 'X';
                        });
                      },

                      tileColor: Colors.indigo[700],
                      activeColor: Colors.blue, // Change the color of the selected radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Move the radio button to the right side
                      dense: true, // Reduce the padding of the radio button
                      contentPadding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7), // Remove the default padding
                    ),
                    SizedBox(height: 10,),
                    RadioListTile<String>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text('O',style: GoogleFonts.montserrat(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                      value: 'O',
                      groupValue: player1Choice,
                      onChanged: (value) {
                        setState(() {
                          player1Choice = value;
                          player2Choice = value == 'O' ? 'X' : 'O';
                        });
                      },
                      tileColor: Colors.indigo[700],
                      activeColor: Colors.blue, // Change the color of the selected radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Move the radio button to the right side
                      dense: true, // Reduce the padding of the radio button
                      contentPadding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7), // Remove the default padding
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Player 2: ${player2Choice ?? 'Not selected'}',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          name1 =textEditingController1.text.toString();
                          name2 =textEditingController2.text.toString();
                        });
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(name1: name1,name2: name2,player1choice: player1Choice,player2choice: player2Choice,)));
                        } else {
                          print("Ok");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      child: Text(
                        "Lets Play",
                        style :GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                      color: Colors.indigo[700],
                      height: 47,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
