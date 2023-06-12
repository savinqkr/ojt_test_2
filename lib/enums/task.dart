enum TaskTypes {
  none,
  starter,
  schedule,
  runProgram,
  executeJob,
  jobStatus,
  and,
  or,
  sleep,
}

TaskTypes convertStringToEnum(String value) {
  for (var taskType in TaskTypes.values) {
    if (taskType.toString() == 'TaskTypes.$value') {
      return taskType;
    }
  }
  return TaskTypes.none; // Default value if no match is found
}

String convertEnumToString(TaskTypes value) {
  switch (value) {
    case TaskTypes.none:
      return 'None';
    case TaskTypes.starter:
      return 'Starter';
    case TaskTypes.schedule:
      return 'Schedule';
    case TaskTypes.runProgram:
      return 'RunProgram';
    case TaskTypes.executeJob:
      return 'ExecuteJob';
    case TaskTypes.jobStatus:
      return 'JobStatus';
    case TaskTypes.and:
      return 'AND';
    case TaskTypes.or:
      return 'OR';
    case TaskTypes.sleep:
      return 'Sleep';
    default:
      return 'No Task';
  }
}
