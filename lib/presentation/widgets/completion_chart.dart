import 'package:flutter/material.dart';

class CompletionChart extends StatelessWidget {
  final int percentage;
  final double size;
  CompletionChart({@required this.percentage, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: percentage / 100),
            duration: Duration(seconds: 5),
            builder: (context, value, child) {
              double percentage = value * 100;
              return Container(
                height: size,
                width: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) => SweepGradient(
                          stops: [value, value],
                          startAngle: 0.0,
                          endAngle: 3.14 * 2,
                          center: Alignment.center,
                          colors: [
                            Theme.of(context).primaryColor,
                            Colors.transparent
                          ]).createShader(rect),
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: Image.asset('assets/scale.png').image),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: size - 30,
                        width: size - 30,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${percentage.toInt()}%",
                              style: TextStyle(
                                  fontSize: size / 7,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              'completed',
                              style: TextStyle(
                                  fontSize: size / 10,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
