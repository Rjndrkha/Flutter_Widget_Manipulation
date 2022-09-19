// v1: move default app to separate function with fixed name
// Add transform widget, rotate and perspective
import 'package:flutter/material.dart';

class PrespectivePage2 extends StatefulWidget {
  const PrespectivePage2({Key? key}) : super(key: key); // changed

  @override
  _PrespectivePage2State createState() => _PrespectivePage2State();
}

class _PrespectivePage2State extends State<PrespectivePage2> {
  int _counter = 0;
  Offset _offset = Offset.zero; // changed

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy) // changed
          ..rotateY(-0.01 * _offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector(
          // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        ));
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Matrix 3D'), // changed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text.rich(
              TextSpan(
                text: 'Made BY',
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(
                    text: ' Rajendra Rakha A P',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
