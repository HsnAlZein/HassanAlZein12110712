import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> activityHistory = [
    {
      'date': '2023-11-24',
      'activity': 'Running',
      'duration': '30 mins',
      'distance': '5 km',
      'caloriesBurned': '300 kcal',
    },
    {
      'date': '2023-11-24',
      'activity': 'Walking',
      'duration': '45 mins',
      'distance': '3 km',
      'caloriesBurned': '200 kcal',
    },
    {
      'date': '2023-11-24',
      'activity': 'Running',
      'duration': '60 mins',
      'distance': '6 km',
      'caloriesBurned': '500 kcal',
    },
    {
      'date': '2023-11-24',
      'activity': 'Walking',
      'duration': '10 mins',
      'distance': '1 km',
      'caloriesBurned': '50 kcal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
      ),
      body: ListView.builder(
        itemCount: activityHistory.length,
        itemBuilder: (context, index) {
          var activity = activityHistory[index];
          return Card(
            child: ListTile(
              title: Text(activity['activity']),
              subtitle: Text('${activity['date']} - ${activity['duration']}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(activity['activity']),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Date: ${activity['date']}'),
                            Text('Duration: ${activity['duration']}'),
                            Text('Distance: ${activity['distance']}'),
                            Text('Calories Burned: ${activity['caloriesBurned']}'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
