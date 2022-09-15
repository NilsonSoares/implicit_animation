import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _height = 50.0;
  double _width = 50.0;

  var _alignment = Alignment.bottomRight;

  late BorderRadiusGeometry _borderRadius;

  void _animate() {
    setState(
      () {
        _alignment = (_alignment == Alignment.bottomRight)
            ? Alignment.topCenter
            : Alignment.bottomRight;

        _borderRadius = _borderRadius == BorderRadius.circular(0)
            ? BorderRadius.circular(_width)
            : BorderRadius.circular(0);
        _width = _width == 50.0 ? 100.0 : 50.0;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _borderRadius = BorderRadius.circular(_width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        title: const Text('Desafio do Botão Flutuante'),
      ),
      body: AnimatedContainer(
        padding: const EdgeInsets.all(16.0),
        duration: const Duration(seconds: 1),
        alignment: _alignment,
        child: GestureDetector(
          child: AnimatedContainer(
            alignment: _alignment,
            padding: const EdgeInsets.all(16.0),
            duration: const Duration(seconds: 1),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: _borderRadius,
            ),
          ),
          onTap: () => _animate(),
        ),
      ),
    );
  }
}
