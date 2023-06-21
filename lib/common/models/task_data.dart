// ignore_for_file: void_checks

import 'package:flutter/material.dart';

class TaskData {
  List<Map> taskData = [
    {
      "jobId": "job1",
      "task": [
        // ROOT
        {
          'type': 'starter',
          'taskId': 'starter1',
          'componentId': '',
          'position': const Offset(550.0, 100.0),
          'connection': ['runProgram1', 'runProgram2']
        },
        // DEPTH 1
        {
          'type': 'runProgram',
          'taskId': 'runProgram1',
          'componentId': '',
          'position': const Offset(350.0, 250.0),
          'connection': ['runProgram3', 'runProgram4']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram2',
          'componentId': '',
          'position': const Offset(750.0, 250.0),
          'connection': ['runProgram5', 'runProgram6', 'runProgram7']
        },
        // DEPTH 2
        {
          'type': 'runProgram',
          'taskId': 'runProgram3',
          'componentId': '',
          'position': const Offset(250.0, 400.0),
          'connection': ['and1']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram4',
          'componentId': '',
          'position': const Offset(450.0, 400.0),
          'connection': ['and1']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram5',
          'componentId': '',
          'position': const Offset(650.0, 400.0),
          'connection': ['or1']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram6',
          'componentId': '',
          'position': const Offset(750.0, 400.0),
          'connection': ['or1']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram7',
          'componentId': '',
          'position': const Offset(850.0, 400.0),
          'connection': ['or1']
        },
        // DEPTH 3
        {
          'type': 'and',
          'taskId': 'and1',
          'componentId': '',
          'position': const Offset(350.0, 550.0),
          'connection': ['executeJob1']
        },
        {
          'type': 'or',
          'taskId': 'or1',
          'componentId': '',
          'position': const Offset(750.0, 550.0),
          'connection': ['executeJob2']
        },
        // DEPTH 4
        {
          'type': 'executeJob',
          'taskId': 'executeJob1',
          'componentId': '',
          'position': const Offset(350.0, 700.0),
          'connection': []
        },
        {
          'type': 'executeJob',
          'taskId': 'executeJob2',
          'componentId': '',
          'position': const Offset(750.0, 700.0),
          'connection': []
        },
      ],
    },
    {
      "jobId": "job2",
      "task": [
        // ROOT
        {
          'type': 'schedule',
          'taskId': 'schedule21',
          'componentId': '',
          'position': const Offset(500.0, 100.0),
          'connection': ['runProgram21', 'runProgram22']
        },
        // DEPTH 1
        {
          'type': 'runProgram',
          'taskId': 'runProgram21',
          'componentId': '',
          'position': const Offset(350.0, 250.0),
          'connection': ['and21']
        },
        {
          'type': 'runProgram',
          'taskId': 'runProgram22',
          'componentId': '',
          'position': const Offset(650.0, 250.0),
          'connection': ['and21']
        },
        // DEPTH 3
        {
          'type': 'and',
          'taskId': 'and21',
          'componentId': '',
          'position': const Offset(500.0, 400.0),
          'connection': ['sleep21']
        },
        // DEPTH 4
        {
          'type': 'sleep',
          'taskId': 'sleep21',
          'componentId': '',
          'position': const Offset(500.0, 550.0),
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

  setComponentId(String taskId, String componentId) {
    for (var data in taskData) {
      List<Map<String, dynamic>> tasks = data['task'];
      for (var task in tasks) {
        if (task['taskId'] == taskId) {
          task['componentId'] = componentId;
        }
      }
    }
  }
}
