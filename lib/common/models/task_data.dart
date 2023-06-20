import 'package:flutter/material.dart';

class TaskData {
  List<Map> taskData = [
    {
      "jobId": "job1",
      "task": [
        {
          'type': 'starter',
          'position': const Offset(300.0, 100.0),
          'connection': [
            {'type': 0, 'other_component_id': ''},
          ]
        },
        {
          'type': 'runProgram',
          'position': const Offset(500.0, 120.0),
          'connection': [
            {'type': 0, 'other_component_id': ''},
          ]
        },
      ],
    },
    {
      "jobId": "job2",
      "task": [
        {
          'type': 'schedule',
          'position': const Offset(400.0, 220.0),
          'connection': []
        },
      ],
    }
  ];

  getTaskList(String jobId) {
    for (var data in taskData) {
      if (data['jobId'] == jobId) {
        return data['task'];
      }
    }
    return [];
  }
}
