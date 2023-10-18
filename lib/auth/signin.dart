// Packages
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Style
import 'package:cyberapp/helpers/style.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Form reference
  final _formKey = GlobalKey<FormState>();
  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Firebase email-password sign-in
  Future empassSignIn() async {
    // Loading animation
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (err) {
      print(err);
    }

    // Remove loading animation
    Navigator.of(context).pop();
  }

  // Google sign-in
  Future<UserCredential> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (err) {
      print(err);
      rethrow;
    }
  }

  // Form validation
  void validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // Form fields are valid
      empassSignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    // To show error if no internet
    bool _isSnackbarActive = false;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                ShowUpAnimation(
                  direction: Direction.vertical,
                  animationDuration: Duration(milliseconds: 500),
                  offset: -0.5,
                  child: CustomText(
                    text: "SIGN IN",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 7,
                  ),
                ),

                SizedBox(height: 50),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ShowUpList(
                        offset: -0.2,
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 800),
                        delayBetween: Duration(milliseconds: 100),
                        curve: Curves.easeInBack,
                        children: [
                          // Email field
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              cursorColor: AppColors.text,
                              cursorWidth: 2,
                              cursorHeight: 20,
                              controller: _emailController,
                              validator: (value) {
                                if (value == "") return "*Required";
                                if (!EmailValidator.validate(value!)) {
                                  return "Please enter a valid email";
                                }
                              },
                              style: TextStyle(color: AppColors.text),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: AppColors.text),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: AppColors.text.withOpacity(0.7),
                                ),
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Password field
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              cursorColor: AppColors.text,
                              cursorWidth: 2,
                              cursorHeight: 20,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == "") return "*Required";
                                if (value!.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                              },
                              style: TextStyle(color: AppColors.text),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: AppColors.text),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: AppColors.text.withOpacity(0.7),
                                ),
                                suffixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 40),

                          // Submit button
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              onPressed: () async {
                                if (await InternetConnectionChecker()
                                    .hasConnection) {
                                  validateAndSubmit();
                                } else if (!_isSnackbarActive) {
                                  setState(() {
                                    _isSnackbarActive = true;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColors.error,
                                          duration: Duration(seconds: 3),
                                          content: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text:
                                                      "Multiplayer mode requires internet!",
                                                  fontSize: 13,
                                                ),
                                                Icon(
                                                  Icons
                                                      .signal_wifi_connected_no_internet_4_outlined,
                                                  color: AppColors.text,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .closed
                                      .then((value) => setState(
                                          () => _isSnackbarActive = false));
                                }
                              },
                              color: AppColors.text,
                              splashColor: AppColors.accent,
                              textColor: AppColors.primary,
                              child: CustomText(
                                text: "Sign In",
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Divider(
                            height: 60,
                            color: AppColors.text,
                            thickness: 0.3,
                            indent: 30,
                            endIndent: 30,
                          ),
                        ],
                      ),
                      ShowUpList(
                        direction: Direction.vertical,
                        animationDuration: Duration(milliseconds: 1000),
                        delayBetween: Duration(milliseconds: 300),
                        curve: Curves.easeInBack,
                        offset: 0.5,
                        children: [
                          // Alternate sign-in options
                          CustomText(text: "OR"),

                          SizedBox(height: 20),

                          // Google sign-in button
                          SignInOption(
                            text: "Sign In with Google",
                            iconURL: "assets/images/google_icon.png",
                            onPressed: () async {
                              if (await InternetConnectionChecker()
                                  .hasConnection) {
                                googleSignIn();
                              } else if (!_isSnackbarActive) {
                                setState(() {
                                  _isSnackbarActive = true;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.error,
                                        duration: Duration(seconds: 3),
                                        content: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text:
                                                    "Multiplayer mode requires internet!",
                                                fontSize: 13,
                                              ),
                                              Icon(
                                                Icons
                                                    .signal_wifi_connected_no_internet_4_outlined,
                                                color: AppColors.text,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .closed
                                    .then((value) => setState(
                                        () => _isSnackbarActive = false));
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInOption extends StatelessWidget {
  const SignInOption({
    super.key,
    this.text = "Sign In",
    required this.iconURL,
    required this.onPressed,
  });
  final String text;
  final String iconURL;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        onPressed: () => this.onPressed(),
        color: AppColors.text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: this.text,
              fontSize: 13,
              color: AppColors.dark,
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(this.iconURL),
            ),
          ],
        ),
      ),
    );
  }
}
