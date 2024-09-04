import 'package:flutter/material.dart';

class ShowAttendancePage extends StatefulWidget {
  final int totalDays;
  final int presentDays;
  final int absentDays;

  ShowAttendancePage({
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
  });

  @override
  _ShowAttendancePageState createState() => _ShowAttendancePageState();
}

class _ShowAttendancePageState extends State<ShowAttendancePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: (widget.presentDays / widget.totalDays) * 100,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated circular progress indicator
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: _animation.value / 100,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _animation.value >= 80 ? Colors.green : Colors.red,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${_animation.value.toStringAsFixed(1)}%',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Text showing present and absent days
            Text(
              'Present Days: ${widget.presentDays} out of ${widget.totalDays}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              'Absent Days: ${widget.absentDays} out of ${widget.totalDays}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            // Note about eligibility for university exams
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Note: If attendance is below 75%, then the student is not applicable for university exams.',
                style: TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
