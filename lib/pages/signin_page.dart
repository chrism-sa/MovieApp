import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/home.dart';
import 'package:movieapp/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true; // Menambahkan status untuk menentukan apakah password tersembunyi

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: sizeWidth * 0.45,
              height: sizeHeight * 0.3,
              child: Image(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: sizeWidth * 0.4,
              child: Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.05,
            ),
            Container(
              width: sizeWidth,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: sizeHeight * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color.fromARGB(255, 104, 156, 167),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 2, 2, 2),
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        height: sizeHeight * 0.0005,
                        color: Colors.black,
                      ),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 13, 13)),
                        ),
                        // enabledBorder: InputBorder.none,
                        fillColor: const Color.fromARGB(255, 154, 231, 247),
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 18, 17, 17),
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          _isObscure, // Menyembunyikan karakter jika true
                      style: TextStyle(
                        height: sizeHeight * 0.0005,
                        color: Colors.black,
                      ),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 10, 10, 10)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 15, 15, 16)),
                        ),
                        fillColor: Color.fromARGB(255, 154, 231, 247),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure; // Toggle status obscure
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.02,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        _doLogin();
                      },
                      // onPressed: () => submit(
                      //   context,
                      //   _emailController.text,
                      //   _passwordController.text,
                      // ),
                      // {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return home();
                      // }));

                      // },
                      child: Text(
                        "Sign In",
                        style:
                            TextStyle(color: Color.fromARGB(255, 24, 25, 25)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        primary: Color.fromARGB(255, 154, 231, 247),
                        side: BorderSide(
                          color: Color.fromARGB(255, 21, 22, 22),
                        ),
                        minimumSize: Size.fromHeight(50),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Belum Memiliki Akun?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return RegisterPage();
                            })));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 168, 11, 196),
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _doLogin() async {
    try {
      var email = _emailController.text;
      var passs = _passwordController.text;

      print('sedang login');
      var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: passs,
      );

      print('Hasil Login : ');
      print(res);
      
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Berhasil Login"),
        backgroundColor: Color.fromARGB(255, 20, 39, 157),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomePage2();
      }));
    } catch (e) {
      print('exception login');
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        print(e);
        print(e.message);
      }

      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Email atau Password Salah"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
