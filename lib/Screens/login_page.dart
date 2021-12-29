import 'dart:ui';

import 'package:arnowa_test/firebase/firebase_auth_services.dart';
import 'package:arnowa_test/model/user_model.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

  LoginPage({Key? key}) : super(key: key);

  UserModel get currentUser => _firebaseAuthServices.currentUser;

  Future login(String password, String email, context) async {
    var result = await _firebaseAuthServices.loginWithEmail(email, password);
    if (result == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    firebaseAuthServices: _firebaseAuthServices,
                  )),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: result is bool
                    ? Image.asset("images/done.png")
                    : Container(
                        height: 150,
                        width: 50,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(color: Colors.black, blurRadius: 100)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  "Error",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(child: Text(result)),
                            ],
                          ),
                        ),
                      ),
              )));
    }
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffffffff), Color(0xffF7E8EF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, .8])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: FlutterLogo(
                    size: 200,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF7E8EF),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Color(0xaae6d7de),
                            blurRadius: 8),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocus,
                        cursorColor: const Color(0xFFEE0C35),
                        onEditingComplete: () => {},
                        // _fieldFocusChange(context, _usernameFocus, _emailFocus),
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFFEE0C35)),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(0xFFFF6F9B)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xffEE0F37),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF7E8EF),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Color(0xaae6d7de),
                            blurRadius: 8),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        focusNode: _passwordFocus,
                        cursorColor: const Color(0xFFEE0C35),
                        onEditingComplete: () => {},
                        // _fieldFocusChange(context, _usernameFocus, _emailFocus),
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFFEE0C35)),
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(0xFFFF6F9B)),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Color(0xffEE0F37),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                        shadowColor: const Color(0xffEE0F37),
                        primary: const Color(0xffEE0F37),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.all(10)
                        // primary: Color(0xffEE0F37),
                        ),
                    onPressed: () {
                      widget.login(_passwordController.value.text.trim(),
                          _emailController.value.text.trim(), context);
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Haven't an account? ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff595959),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Create here",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFEE0C35))))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
