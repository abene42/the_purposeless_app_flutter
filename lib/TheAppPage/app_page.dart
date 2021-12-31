import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
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
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Logo',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 27.94,
                        ),
                      ),
                    ],
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
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.red,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(236, 9, 38, 1),
                      enabled: true,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  Container(
                    height: 282,
                    width: 276,
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
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      const Positioned(
                        left: 60,
                        child: CircleAvatar(
                          radius: 20,
                          child: Text(
                            '24',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(236, 7, 37, 1)),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        width: 100.86,
                        height: 93.73,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/among_us_avatar.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
