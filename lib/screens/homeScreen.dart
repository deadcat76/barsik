import 'dart:math' show sqrt;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _earsController;
  late Animation<double> _earsAnimation;
  late AnimationController _tailController;
  late Animation<double> _tailAnimation;
  final double _maxRepeatEars = 2;
  int _repeatCountEars = 0;
  int _textRepeatCount = 0;
  bool _showButton = false;
  bool _textAnimationCompleted = false;
  bool _earsShown = false;
  bool _startAnimation = false;
  var string = "БАРСИК";

  @override
  void initState() {
    super.initState();

    _earsController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _earsAnimation = Tween<double>(begin: 1, end: -1).animate(
      CurvedAnimation(
        parent: _earsController,
        curve: Curves.easeInOut,
      ),
    );

    _tailController = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500),
      vsync: this,
    );

    _tailAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _tailController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _startAnimation = true;
      });
    });

    _earsController.repeat(reverse: true);
  }

  void _startButtonAnimation() async {
    while (_repeatCountEars < _maxRepeatEars) {
      await _earsController.forward();
      await _earsController.reverse();
      setState(() {
        _repeatCountEars++;
        if (_repeatCountEars == _maxRepeatEars) {
          _showButton = true;
        }
      });
    }
  }

  void _onTextAnimationFinished() {
    _textRepeatCount++; // Увеличиваем счетчик

    if (_textRepeatCount >= 1) {
      if (_textAnimationCompleted) return;
      setState(() {
        _textAnimationCompleted = true; // Завершаем текстовую анимацию
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            _earsShown = true;
          });
          _tailController.forward();
          _startButtonAnimation(); // Запускаем анимацию ушей
        });
      });
    }
  }

  @override
  void dispose() {
    _earsController.dispose();
    _tailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const childHeight = 33.0;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/home.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              top: 346,
              left: 146,
              child: AnimatedBuilder(
                animation: _tailAnimation,
                builder: (context, child) {
                  return ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: _tailAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/cat_tail.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 252,
              left: 649,
              child: AnimatedOpacity(
                opacity: _earsShown ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedBuilder(
                  animation: _earsAnimation,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..translate(
                            0.0,
                            childHeight -
                                childHeight * sqrt(_earsAnimation.value.abs()))
                        ..scale(1.0, _earsAnimation.value.abs()),
                      child: child,
                    );
                  },
                  child: Align(
                      child: SvgPicture.asset('assets/ears_left.svg',
                          height: childHeight)),
                ),
                onEnd: () {
                  _startButtonAnimation();
                },
              ),
            ),
            Positioned(
              top: 270,
              left: 735,
              child: AnimatedOpacity(
                opacity: _earsShown ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Align(
                    child: SvgPicture.asset('assets/ears_right.svg',
                        height: childHeight)),
              ),
            ),
            Positioned(
                top: 220,
                left: 11,
                child: _startAnimation
                    ? AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      string,
                      textStyle: TextStyle(
                        fontSize: 185,
                        fontFamily: 'ARCOCyrillic',
                        letterSpacing: -2.0,
                        color: HexColor("#558384"),
                      ),
                      speed: const Duration(milliseconds: 400),
                    ),
                  ],
                  repeatForever: false,
                  totalRepeatCount: 1,
                  isRepeatingAnimation: false,
                  onFinished: () {
                    _onTextAnimationFinished();
                  },
                ): Text(string,
                  style: TextStyle(
                    fontSize: 185,
                    fontFamily: 'ARCOCyrillic',
                    letterSpacing: -2.0,
                    color: HexColor("#558384"),
                  ),
                )),
            Positioned(
                top: 520,
                left: 200,
                child: AnimatedOpacity(
                  opacity: _showButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#558384")),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(
                                left: 100, top: 15, bottom: 15, right: 100)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRoutesConstants.ageSetRoute);
                    },
                    child: const Text(
                      'Играть!',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
