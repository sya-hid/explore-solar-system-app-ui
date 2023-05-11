import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int durationInMs, delayInMs;
  final MyAnimation position;
  const FadeInAnimation(
      {super.key,
      required this.child,
      required this.durationInMs,
      required this.delayInMs,
      required this.position});

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  bool? animate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeAnimation();
  }

  Future changeAnimation() async {
    animate = false;
    await Future.delayed(Duration(milliseconds: widget.delayInMs));
    if (mounted) {
      setState(() {
        animate = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.durationInMs),
      curve: Curves.easeInOut,
      top: animate! ? widget.position.topAfter : widget.position.topBefore,
      left: animate! ? widget.position.leftAfter : widget.position.leftBefore,
      bottom:
          animate! ? widget.position.bottomAfer : widget.position.bottomBefore,
      right:
          animate! ? widget.position.rightAfter : widget.position.rightBefore,
      child: widget.child,
    );
  }
}

class MyAnimation {
  final double? topAfter, leftAfter, bottomAfer, rightAfter;
  final double? topBefore, leftBefore, bottomBefore, rightBefore;

  MyAnimation(
      {this.topAfter,
      this.leftAfter,
      this.bottomAfer,
      this.rightAfter,
      this.topBefore,
      this.leftBefore,
      this.bottomBefore,
      this.rightBefore});
}
