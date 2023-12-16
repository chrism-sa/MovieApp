import 'package:flutter/material.dart';
import 'package:movieapp/pages/signin_page.dart';
import 'package:movieapp/pages/signup_page.dart';

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: sizeHeight * 0.15,
            ),
            Container(
              width: sizeWidth * 0.5,
              height: sizeHeight * 0.2,
              child: Image(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.contain,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("images/baphomet.jpg"),
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
            SizedBox(height: 30,),
            Container(
              height: sizeHeight * 0.3,
              width: sizeWidth * 0.5,
              child: Text(
                "Aplikasi Movie Tanpa Ribet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text("Sign In",style: TextStyle(color: Color.fromARGB(255, 3, 3, 3))),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Color.fromARGB(255, 104, 156, 167),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  }));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Color.fromARGB(255, 2, 6, 50),
                  side: BorderSide(
                    color: Color.fromARGB(255, 2, 6, 50),
                  ),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
