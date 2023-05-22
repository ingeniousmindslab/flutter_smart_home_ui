import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/widgets/transparent_card.dart';
import 'package:rainbow_color/rainbow_color.dart';

class SpeedWidget extends StatelessWidget {
  final int speed;
  final Function(int) changeSpeed;

  const SpeedWidget({Key? key, required this.speed, required this.changeSpeed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Speed",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _button(1, speed == 1),
              _button(2, speed == 2),
              _button(3, speed == 3),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _button(int speed, bool isActive) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: isActive ? Colors.black : Colors.white,
          primary: isActive ? Colors.white : Colors.transparent,
          minimumSize: const Size(38, 38),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          side: BorderSide(color: Colors.white.withOpacity(0.4)),
          elevation: 0),
      onPressed: () => changeSpeed(speed),
      child: Text(speed.toString()),
    );
  }
}

class BulbLifghtWidget extends StatelessWidget {
  final Color colors;
  final GestureTapCallback onTapColor;

  const BulbLifghtWidget(
      {Key? key, required this.colors, required this.onTapColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeColor = Rainbow(spectrum: [
      const Color(0xFF9400D3),
      const Color(0xFF4B0082),
      const Color(0xFF0000FF),
      const Color(0xFF00FF00),
      const Color(0xFFFFFF00),
      const Color(0xFFFF7F00),
      const Color(0xFFFF0000),
    ], rangeStart: 0.0, rangeEnd: 1.0);

    return TransparentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lightes",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return ClipOval(
                  child: GestureDetector(
                    onTap: onTapColor,
                    child: Container(
                      height: 10,
                      width: 10,
                      color: activeColor[index / 6],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
