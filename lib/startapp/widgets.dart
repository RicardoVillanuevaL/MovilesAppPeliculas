import 'package:flutter/material.dart';

class ButtonTransparent extends StatefulWidget {
  const ButtonTransparent({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  _ButtonTransparentState createState() => _ButtonTransparentState();
}

class _ButtonTransparentState extends State<ButtonTransparent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white24),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    );
  }
}

class IndicatorPage extends StatefulWidget {
  final bool activado;
  const IndicatorPage(this.activado);

  @override
  _IndicatorPageState createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: widget.activado ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}

class InputTransparent extends StatelessWidget {
  const InputTransparent(
      {Key? key,
      required this.size,
      required this.text,
      required this.controller,
      required this.icon})
      : super(key: key);

  final Size size;
  final String text;
  final TextEditingController controller;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: text,
              hintStyle: TextStyle(color: Colors.white, fontSize: 18),
              icon: icon)),
    );
  }
}
