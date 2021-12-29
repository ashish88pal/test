import 'dart:ui';

import 'package:arnowa_test/Screens/home_page.dart';
import 'package:arnowa_test/firebase/firebase_auth_services.dart';
import 'package:arnowa_test/model/user_model.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

  SignUpPage({Key? key}) : super(key: key);

  UserModel get currentUser => _firebaseAuthServices.currentUser;

  Future signUp(String name, String email, String password, context) async {
    var result =
        await _firebaseAuthServices.signupWithEmail(name, password, email);

    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: result is bool
                    ? const Icon(
                        Icons.done,
                        size: 50,
                      )
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
              ),
            ));

    if (result is bool) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    firebaseAuthServices: _firebaseAuthServices,
                  )),
          (route) => false);
    }
  }

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        focusNode: _usernameFocus,
                        cursorColor: const Color(0xFFEE0C35),
                        onEditingComplete: () => {},
                        // _fieldFocusChange(context, _usernameFocus, _emailFocus),
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFFEE0C35)),
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Color(0xFFFF6F9B)),
                          prefixIcon: Icon(
                            Icons.person,
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
                        focusNode: _emailFocus,
                        cursorColor: const Color(0xFFEE0C35),
                        onEditingComplete: () => {},
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
                        textInputAction: TextInputAction.done,
                        focusNode: _passwordFocus,
                        cursorColor: const Color(0xFFEE0C35),

                        onEditingComplete: () => {},
                        //     model.signUp(
                        //   email: _emailController.text,
                        //   password: _passwordController.text,
                        //   name: _usernameController.text,
                        // ),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffEE0F37),
                      shadowColor: const Color(0xffEE0F37),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(10)
                      // primary: Color(0xffEE0F37),
                      ),
                  onPressed: () {
                    widget.signUp(
                        _usernameController.value.text.trim(),
                        _emailController.value.text.trim(),
                        _passwordController.value.text.trim(),
                        context);
                  },
                  child: const SizedBox(
                    child: Center(
                        child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          color: Colors.white),
                    )),
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Already have an account? ",
                          style: TextStyle(
                              fontSize: 18, color: Color(0xff595959))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text("Login here",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFEE0C35))))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
