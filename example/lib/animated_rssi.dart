import 'package:flutter/material.dart';
import 'package:flutter_blue/utils/lerp.dart';

const double minRssi = -90.0;
const double maxRssi = -60.0;

class AnimatedRssi extends StatefulWidget {
  final int rssi;

  AnimatedRssi(this.rssi);

  @override
  AnimatedRssiState createState() => new AnimatedRssiState();
}

class AnimatedRssiState extends State<AnimatedRssi>
    with SingleTickerProviderStateMixin {

  double currentRssi = minRssi;
  AnimationController animation;
  CurvedAnimation curvedAnimation;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    currentRssi = widget.rssi.toDouble();

    animation = new AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this);
    curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.elasticOut, reverseCurve: Curves.elasticOut);
    tween = new Tween<double>(begin: minRssi, end: currentRssi);
    animation.forward();
  }


  @override
  void didUpdateWidget(AnimatedRssi oldWidget) {
    setState((){
      currentRssi = widget.rssi.toDouble();
      tween = new Tween<double>(
        begin: tween.evaluate(animation),
        end: currentRssi,
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 48.0,
      height: 48.0,
      child: new CustomPaint(
          painter: new RssiPainter(tween.animate(curvedAnimation))
      ),
    );
  }
}

class RssiPainter extends CustomPainter {

  RssiPainter(Animation<double> animation)
        : animation = animation,
        super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final rssi = animation.value;
    final paintBg = new Paint()
      ..color = const Color.fromARGB(255, 220, 220, 220)
      ..style = PaintingStyle.fill;
    final paintFg = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    var rectBg = new Rect.fromCircle(
      center: new Offset(size.width/2, size.height/1.5),
      radius: size.height/2,
    );
    var rectFg = new Rect.fromCircle(
      center: new Offset(size.width/2, size.height/1.5),
      radius: (size.height/2) * inverseLerp(minRssi, maxRssi, rssi).clamp(0.0,1.0),
    );

    canvas.drawArc(rectBg, 3.66519, 2.0944, true, paintBg);
    canvas.drawArc(rectFg, 3.66519, 2.0944, true, paintFg);
  }

  @override
  bool shouldRepaint(RssiPainter oldDelegate) => false;
}

class RssiPainterCircle extends CustomPainter {

  RssiPainterCircle(Animation<double> animation)
      : animation = animation,
        super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final rssi = animation.value;
    final paintFg = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(new Offset(size.width/2,size.height/2), (size.height/2) * inverseLerp(minRssi, maxRssi, rssi).clamp(0.0,1.0), paintFg);
  }

  @override
  bool shouldRepaint(RssiPainterCircle oldDelegate) => false;
}