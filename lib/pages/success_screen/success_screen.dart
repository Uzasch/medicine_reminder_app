import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(
          child: FlareActor(
        'assets/animations/Success Check.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'Untitiled',
      )),
    );
  }
}
