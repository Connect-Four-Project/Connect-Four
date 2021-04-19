import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Icon icon;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.icon,
  }) : super(key: key);

  List<Widget> getContent() {
    List<Widget> ret = new List<Widget>();
    if (icon != null) {
      ret.add(icon);
      ret.add(SizedBox(
        width: 10.0,
      ));
    }
    ret.add(Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'PressStart2P',
      ),
    ));
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RawMaterialButton(
      fillColor: Color(0xFF6F35A5),
      splashColor: Color(0xFFF1E6FF),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: getContent(),
        ),
      ),
      onPressed: press,
      shape: const StadiumBorder(),
    );
  }
}
