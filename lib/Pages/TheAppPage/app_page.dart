import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_purposeless_app/Controllers/authentication.dart';
import 'package:the_purposeless_app/Widgets/google_signin_button.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(119, 119, 119, 1),
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/demo_logo.png'),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Put your code here',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 18.09,
                        ),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, 0.0),
                          end: Alignment.centerRight,
                          tileMode: TileMode.mirror,
                          colors: [
                            Color.fromRGBO(236, 9, 38, 1),
                            Color.fromRGBO(229, 3, 32, 1),
                          ],
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.red,
                          fontSize: 28,
                        ),
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Container(
                    height: 242,
                    width: 226,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/qr_code_placeholder.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 5.34444,
                          offset: Offset(2.87778, 2.3333),
                        )
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      const Positioned(
                        left: 110,
                        top: 5,
                        child: CircleAvatar(
                          radius: 16,
                          child: Text(
                            '24',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(236, 7, 37, 1),
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 93.73,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/among_us_avatar.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Your Points',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.09,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Container(
                    width: 180,
                    height: 50,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.mirror,
                        colors: [
                          Color.fromRGBO(255, 31, 59, 1),
                          Color.fromRGBO(176, 0, 23, 1),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Export',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.09,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 51.46,
                                  width: 51.46,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/exchange_rectangle.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 23.23,
                                  left: 12.615,
                                  child: Container(
                                    height: 3,
                                    width: 25.23,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Exchange',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future:
                            Authentication.initializeFirebase(context: context),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error initializing Firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const GoogleSignInButton();
                          }
                          return const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
