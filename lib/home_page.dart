import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'detail.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 1.0,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Add Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Show date picker
                            _showDatePicker(context);
                          },
                          icon: Icon(Icons.date_range),
                        ),
                        SizedBox(width: 8),
                        Text(
                          _selectedDate != null
                              ? DateFormat('dd MMM yyyy').format(_selectedDate!)
                              : 'Select date',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Show time picker
                            _showTimePicker(context);
                          },
                          icon: Icon(Icons.access_time),
                        ),
                        SizedBox(width: 8),
                        Text(
                          _selectedTime != null
                              ? _selectedTime!.format(context)
                              : 'Select time',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      // Handle the selected date
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Handle the selected time
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> iconList = [
      Icons.list_alt,
      // Icons.add_circle,
      Icons.person,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[50],
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(
                    "Welcome",
                    style: TextStyle(color: Colors.black87),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout),
                      color: Colors.black87,
                    )
                  ],
                )
              ],
          body: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the detail page when the Card is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailEventPage(), // Replace DetailPage() with the actual name of your detail page
                          ),
                        );
                      },
                      child: Card(
                        color: Color(0xFFCCE6FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 23),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "18 Juli 2023",
                                            style: TextStyle(
                                                color: Color(0xFF0069CC),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   "10.00 AM",
                                          //   style: TextStyle(
                                          //       color: Color(0xFF0069CC)),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Upgrading Skill",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Upgrading dan pelatihan ",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0069CC),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: iconList.map((icon) {
          return BottomNavigationBarItem(
            icon: Icon(icon),
            label:
                "", // You can set a label if needed, or leave it empty to hide the label
          );
        }).toList(),
        currentIndex: _bottomNavIndex,
        selectedItemColor: Color(0xFF0069CC),
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
          if (index == 0) {
            // Navigate to Home Page when index 0 is selected
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          } else if (index == 1) {
            // Navigate to Profile Page when index 1 is selected
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
