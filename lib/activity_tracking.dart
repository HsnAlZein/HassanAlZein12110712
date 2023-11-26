import 'package:flutter/material.dart';
import 'dart:async';

class ActivityTracking extends StatefulWidget {
  @override
  _ActivityTrackingState createState() => _ActivityTrackingState();
}

class _ActivityTrackingState extends State<ActivityTracking> {
  bool isActivityStarted = false;
  bool isActivityCompleted = false;
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (isActivityStarted) {
      stopwatch.stop();
      timer?.cancel();
      setState(() {
        isActivityCompleted = true;
      });
    } else {
      stopwatch.reset();
      stopwatch.start();
      isActivityCompleted = false; 
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {});
      });
    }
    setState(() {
      isActivityStarted = !isActivityStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Tracking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isActivityStarted ? 'Activity in Progress...' :
              isActivityCompleted ? 'Activity Done' : 'No Activity Started',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              stopwatch.elapsed.inHours.toString().padLeft(2, '0') + ':' +
              (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') + ':' +
              (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleStartStop,
              child: Text(isActivityStarted ? 'Stop Activity' : 'Start Activity'),
            ),
          ],
        ),
      ),
    );
  }
}
