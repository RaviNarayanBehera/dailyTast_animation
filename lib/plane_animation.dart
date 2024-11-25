import 'package:flutter/material.dart';

class PlaneAnimation extends StatefulWidget {
  const PlaneAnimation({super.key});

  @override
  State<PlaneAnimation> createState() => _PlaneAnimationState();
}

class _PlaneAnimationState extends State<PlaneAnimation> {
  bool _isPlaneUp = false;
  int index = 0;

  final List<Alignment> align = [
    Alignment.bottomCenter,
    Alignment.topCenter,
  ];

  void _toggleAnimation() {
    setState(() {
      _isPlaneUp = !_isPlaneUp;

      // Ensure the index wraps within the range of the list
      if (index == align.length - 1) {
        index = 0;
      } else {
        index++;
      }
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plane Animation'),
        backgroundColor: Colors.teal,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        color: _isPlaneUp ? Colors.black : Colors.white,
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: AnimatedAlign(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  alignment: _isPlaneUp ? Alignment.topCenter : align[index],
                  child: Icon(
                    Icons.flight,
                    size: 48,
                    color: Colors.teal,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _toggleAnimation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    "Animation",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
