import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //print(animationActive);
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        //backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: CardWithAnimations(),
      ),
    );
  }
}

class CardWithAnimations extends StatefulWidget {
  const CardWithAnimations({
    super.key,
  });

  @override
  State<CardWithAnimations> createState() => _CardWithAnimationsState();
}

class _CardWithAnimationsState extends State<CardWithAnimations>
    with TickerProviderStateMixin {
  late final AnimationController _saveController;
  late final AnimationController _likeController;
  late final AnimationController _imageLikeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _saveController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _likeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _imageLikeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _saveController.dispose();
    _likeController.dispose();
    _imageLikeController.dispose();
  }

  bool animationSaveActive = false;
  bool animationLikeActive = false;
  bool animationImageLikeActive = false;

  Color contentColor = Color.fromARGB(255, 187, 236, 255);
  Color bottomBarColor = Color.fromARGB(255, 236, 236, 236);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        width: 400,
        height: 400,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      border: Border(
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                    height: 400,
                  ),
                  InkWell(
                    onDoubleTap: () {
                      setState(
                        () {
                          animationImageLikeActive = true;
                          animationLikeActive = true;
                        },
                      );
                      _likeController.forward();
                      _imageLikeController.forward();
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          _imageLikeController.reset();
                          setState(() {
                            animationImageLikeActive = false;
                          });
                        },
                      );
                      //animationImageLikeActive = false;
                      print(animationImageLikeActive);
                    },
                    child: animationImageLikeActive
                        ? Center(
                            child: Lottie.network(
                              'https://lottie.host/803ac36a-a6cc-4850-ab2d-191e7d10a104/JwEXkmeoIp.json',
                              controller: _imageLikeController,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            Container(
              width: 500,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)
                      ),
                      onTap: () {
                        if (animationLikeActive) {
                          setState(() {
                            animationLikeActive = false;
                          });
                          _likeController.reverse();
                        } else {
                          setState(() {
                            animationLikeActive = true;
                          });
                          _likeController.forward();
                        }
                      },
                      splashColor: bottomBarColor,
                      focusColor: bottomBarColor,
                      highlightColor: Color.fromARGB(255, 216, 216, 216),
                      child: ClipRRect(
                        child: Ink(
                          decoration: BoxDecoration(
                            color: bottomBarColor,
                            border: Border.all(color: bottomBarColor, width: 0),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Lottie.network(
                            'https://lottie.host/58d9d373-2e56-43c8-88a0-ec7ece32960b/2oVhhEGPop.json',
                            controller: _likeController,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: InkWell(
                  //     onTap: () {},
                  //     splashColor: Colors.blue,
                  //     focusColor: Colors.blue,
                  //     highlightColor: const Color.fromARGB(255, 65, 170, 255),
                  //     child: Ink(
                  //         height: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: bottomBarColor,
                  //           border: Border.all(color: bottomBarColor, width: 0),
                  //         ),
                  //         child: Icon(Icons.message_rounded)),
                  //   ),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: InkWell(
                  //     onTap: () {},
                  //     splashColor: Colors.blue,
                  //     focusColor: Colors.blue,
                  //     highlightColor: const Color.fromARGB(255, 65, 170, 255),
                  //     child: Ink(
                  //         height: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: bottomBarColor,
                  //           border: Border.all(color: bottomBarColor, width: 0),
                  //         ),
                  //         child: Icon(Icons.send)),
                  //   ),
                  // ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: bottomBarColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)
                      ),
                      onTap: () {
                        if (animationSaveActive) {
                          setState(() {
                            animationSaveActive = false;
                          });
                          _saveController.reverse();
                        } else {
                          setState(() {
                            animationSaveActive = true;
                          });
                          _saveController.forward();
                        }
                      },
                      splashColor: bottomBarColor,
                      focusColor: bottomBarColor,
                      highlightColor: Color.fromARGB(255, 216, 216, 216),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: bottomBarColor,
                          border: Border.all(color: bottomBarColor, width: 0),
                        ),
                        child: Lottie.network(
                          'https://lottie.host/9d837e06-3c28-425a-8b60-b8b2d8424840/uiafHEiR5w.json',
                          controller: _saveController,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
