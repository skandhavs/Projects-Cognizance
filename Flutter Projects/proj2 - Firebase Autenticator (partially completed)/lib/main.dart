import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black54,


      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  get FireAuth => null;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(backgroundColor: Colors.black,
          centerTitle:true,
          title: const Text('Firebase Authenticator System' ,
            style: TextStyle(
                fontFamily: 'Orb',
                color:Colors.yellow,fontSize: 16
            ),)
        ),
        body: FutureBuilder(


          future: _initializeFirebase(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(

                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Orb',
                          color:Colors.yellow,fontSize: 30
                      ),
                      ),
                    ),
                    Form(

                      key: _formKey,
                      child: Column(

                        children: <Widget>[
                          TextFormField(
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,
                                      color: Colors.grey
                                  ),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,
                                      color: Colors.grey
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontFamily: 'Orb',
                                )
                          ),),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,
                                      color: Colors.grey
                                  ),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1,
                                      color: Colors.grey
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontFamily: 'Orb',
                                )
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          _isProcessing
                              ? const CircularProgressIndicator()
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.yellowAccent), ),
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();
                                    if (_formKey.currentState!
                                        .validate()) {
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      User? user = await FireAuth
                                          .signInUsingEmailPassword(
                                        email: _emailTextController.text,
                                        password:
                                        _passwordTextController.text,
                                      );
                                      setState(() {
                                        _isProcessing = false;
                                      });
                                    }
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.black,fontFamily: 'Orb'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24.0),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            return Text(".");
          },
        ),
      ),
    );
  }
}