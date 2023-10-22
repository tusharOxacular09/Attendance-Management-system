import 'package:flutter/material.dart';

class MyAppDash extends StatefulWidget {
  const MyAppDash({Key? key}) : super(key: key);

  @override
  State<MyAppDash> createState() => _WebDashboard();
}

class Task {
  final String name;
  final String status;

  Task(this.name, this.status);
}

class LeaveApplication {
  final String applicantName;
  final String leaveType;
  final String startDate;
  final String endDate;
  final String description;

  LeaveApplication(
      this.applicantName, this.leaveType, this.startDate, this.endDate, this.description);
}

class _WebDashboard extends State<MyAppDash> {
  final List<Task> tasks = [
    Task('Task 1', 'Progress'),
    Task('Task 2', 'Done'),
    Task('Task 3', 'To Do'),
    Task('Task 4', 'Done'),
    // Add more tasks here
  ];
  final List<LeaveApplication> leaveApplications = [
    LeaveApplication('John Doe', 'Vacation Leave', '2023-10-25', '2023-10-30', "Leave Reason due to the examination in Bhubaneswar."),
    LeaveApplication('Jane Smith', 'Sick Leave', '2023-11-05', '2023-11-10', "Leave Reason due to the Health issue and addmitted in the hospital."),
    // Add more leave applications as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // catagories
        Container(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: screenWidth * 0.4,
                          child: RoundedCard(
                            card_color: Colors.blue,
                            label: 'Attendance',
                            icon: Icons
                                .timelapse, // Replace with your attendance logo
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          child: RoundedCard(
                            card_color: Colors.green,
                            label: 'Tasks',
                            icon: Icons.list, // Replace with your tasks logo
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: screenWidth * 0.4,
                          child: RoundedCard(
                            card_color: const Color.fromARGB(255, 247, 226, 36),
                            label: 'Leave Request',
                            icon: Icons
                                .request_page, // Replace with your leave request logo
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          child: RoundedCard(
                            card_color: Colors.red,
                            label: 'Time Tracking',
                            icon: Icons
                                .access_alarm, // Replace with your time tracking logo
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),

        // Today's Task
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Today's Task",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    for (Task task in tasks) TaskCard(task: task),
                  ],
                ),
              ),
            )
          ],
        )),

        // Leave Requests
         Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Recent Leave Request",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    for (LeaveApplication leave in leaveApplications) LeaveApplicationCard(leaveApplication: leave),
                  ],
                ),
              ),
            )
          ],
        )),
      ],
    );
  }
}

class LeaveApplicationCard extends StatelessWidget {
  final LeaveApplication leaveApplication;

  LeaveApplicationCard({required this.leaveApplication});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.92,
      margin: EdgeInsets.all(16),
      child: Card(
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    leaveApplication.applicantName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(leaveApplication.leaveType,
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),)
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    leaveApplication.startDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(leaveApplication.endDate,
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),)
                ],
              ),
              const SizedBox(height: 6.0),
              Text(leaveApplication.description, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.65, // Adjust the card width as needed
      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                task.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status: ${task.status}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: Text('More Details'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color card_color;

  RoundedCard(
      {required this.label, required this.icon, required this.card_color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: card_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.white, // Customize the icon color
            ),
            const SizedBox(height: 10.0),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
