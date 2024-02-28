import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GestureContainer(),
      ),
    );
  }
}

class GestureContainer extends StatefulWidget {
  const GestureContainer({
    super.key,
  });

  @override
  State<GestureContainer> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final _widgetDraggableKey = GlobalKey();

  final _draggableWidgetSize = const Size(150, 150);

  late double _posX;
  late double _posY;

  final _backgroundColors = <Color>[
    Colors.green.shade50,
    Colors.green.shade100,
    Colors.green.shade200,
    Colors.green.shade300,
  ];

  late Color _currentBackgroundColor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );

    _currentBackgroundColor = _backgroundColors[0];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _posX =
        MediaQuery.of(context).size.width / 2 - _draggableWidgetSize.width / 2;
    _posY =
        MediaQuery.of(context).size.height / 2 - _draggableWidgetSize.height;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _changeBackgroundColor() {
    int currentIndex = _backgroundColors.indexOf(_currentBackgroundColor);
    if (currentIndex < _backgroundColors.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    setState(() {
      _currentBackgroundColor = _backgroundColors[currentIndex];
    });
  }

  void _changePositionOnScreen(DragUpdateDetails details) {
    final sizeDraggableObj = _draggableWidgetSize;
    final sizeScreen = MediaQuery.of(context).size;

    late double sysBottomNavHeight = MediaQuery.of(context).padding.top;

    if (_posX + details.delta.dx < 0) {
      _posX = 0;
    } else if (_posX + sizeDraggableObj.width + details.delta.dx >
        sizeScreen.width) {
      _posX = sizeScreen.width - sizeDraggableObj.width;
    } else {
      _posX += details.delta.dx;
    }

    if (_posY + details.delta.dy < 0) {
      _posY = 0;
    } else if (_posY +
            sizeDraggableObj.height +
            details.delta.dy +
            sysBottomNavHeight >
        sizeScreen.height) {
      _posY = sizeScreen.height - sizeDraggableObj.height - sysBottomNavHeight;
    } else {
      _posY += details.delta.dy;
    }

    setState(() {});
  }

  void _animateRotationTransition() {
    if (!_animationController.isAnimating) {
      _animationController.forward(from: 0);
    }
  }

  void _resetRotationTransition() {
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 0),
            color: _currentBackgroundColor,
          ),
          Positioned(
            left: _posX,
            top: _posY,
            key: _widgetDraggableKey,
            child: RotationTransition(
              turns: _animation,
              child: Container(
                width: _draggableWidgetSize.width,
                height: _draggableWidgetSize.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=9a0f10396baf2e845b9d7a799d40774fcd27ad21-10810377-images-thumbs&n=13'),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _resetRotationTransition();
                _changeBackgroundColor();
              },
              onLongPress: () {
                _animateRotationTransition();
              },
              onPanUpdate: (details) {
                _resetRotationTransition();
                _changePositionOnScreen(details);
              },
            ),
          ),
        ],
      ),
    );
  }
}
