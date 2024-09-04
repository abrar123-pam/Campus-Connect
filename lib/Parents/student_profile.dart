import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  bool isExpanded = false;

  Widget _buildProfileHeader() {
    return Container(
      height: 220,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage('images/abrar.png'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10), // Add some space between the CircleAvatar and the name
          Text(
            'Abrar Musharraf P',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: <Widget>[
          _buildProfileHeader(),
          _buildSectionTitle('Student Information'),
          _buildInformationRow('Email', 'abrarmusharraf6128@gmail.com'),
          _buildInformationRow('Register Number', '311820104004'),
          _buildInformationRow('Year', 'Final Year'),
          _buildInformationRow(
              'Department', 'Computer Science and Engineering'),
          _buildInformationRow('Semester', 'Eight Semester'),
          _buildInformationRow('Student Number', '+91 8608873029'),
          _buildInformationRow('Parent Number', '+91 8248988394'),
          _buildSectionTitle('Additional Information'),
          isExpanded
              ? _buildInformationRow(
              'Achievements',
              '-> Winner of Coding Club Event, '
                  '->Participant in Smart india hackathon')
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isExpanded ? 'Show less' : 'Show more',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget _buildInformationRow(String label, String value) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black38),
  //       borderRadius: BorderRadius.circular(1),
  //     ),
  //     margin: EdgeInsets.all(5),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Text(
  //               '$label: ',
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             Expanded(
  //               child: Text(
  //                 value,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.blueAccent,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildInformationRow(String label, String value) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

}
