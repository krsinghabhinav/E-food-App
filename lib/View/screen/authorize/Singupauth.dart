import '../homesWidgets/homeView.dart';
import 'package:demoteteee/credancial/singup.dart';
import 'package:demoteteee/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late UserProvider userProvider;
  // UserProvider userProvider;
  // SingupAuth singupAuth = SingupAuth();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assest/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign in to Contunue",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Vegi",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color.fromARGB(255, 9, 66, 2),
                              offset: Offset(4,
                                  4), // You can adjust the offset for the shadow
                            ),
                            BoxShadow(
                              blurRadius: 15,
                              color: Color.fromARGB(255, 9, 66, 2),
                              offset: Offset(-4, -3),
                            ),
                            BoxShadow(
                              blurRadius: 20,
                              color: Color.fromARGB(255, 9, 66, 2),
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      SignInButton(
                        Buttons.Apple,
                        onPressed: () {},
                      ),

                      // with custom text
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () async {
                          await googleSignUp().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          });
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "By singning in you are agreeing to our",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Teams and Pricacy Policy",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
