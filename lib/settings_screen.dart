import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isMetric = true;
  int dailyStepGoal = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Use Metric Units (km)'),
            value: isMetric,
            onChanged: (bool newValue) {
              setState(() {
                isMetric = newValue;
              });
            },
          ),
          ListTile(
            title: const Text('Daily Step Goal'),
            subtitle: Text('$dailyStepGoal steps'),
            onTap: () {
              _showStepGoalDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showStepGoalDialog(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    textFieldController.text = dailyStepGoal.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Daily Step Goal'),
          content: TextField(
            controller: textFieldController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Enter your daily step goal"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  dailyStepGoal = int.tryParse(textFieldController.text) ?? dailyStepGoal;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
