import 'package:flutter/material.dart';

class DetailEventPage extends StatefulWidget {
  @override
  _DetailEventPageState createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  bool isTugasAdded = false;
  bool isBatasWaktuAdded = false;
  bool isPengingatAdded = false;

  void _changeColorAfterTap(int index) {
    setState(() {
      if (index == 0) {
        isTugasAdded = true;
      } else if (index == 1) {
        isBatasWaktuAdded = true;
      } else if (index == 2) {
        isPengingatAdded = true;
      }
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        if (index == 0) {
          isTugasAdded = false;
        } else if (index == 1) {
          isBatasWaktuAdded = false;
        } else if (index == 2) {
          isPengingatAdded = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.waving_hand_rounded,
                  color: Color.fromARGB(190, 236, 139, 11),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Welcome',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 26.0,
                ),
              ),
              SizedBox(width: 2),
            ],
          ),
          titleSpacing: -10,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Upgrading Skill',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Upgrading dan pelatihan admistrasi keuangan',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 180,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: isTugasAdded ? Colors.blue : null,
                  ),
                  title: Text(
                    'Tambah Tugas',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: isTugasAdded
                          ? Colors.blue
                          : const Color.fromARGB(255, 57, 55, 55),
                    ),
                  ),
                  onTap: () {
                    _changeColorAfterTap(0);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_month_rounded,
                    color: isBatasWaktuAdded ? Colors.blue : null,
                  ),
                  title: Text(
                    'Batas Waktu',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: isBatasWaktuAdded
                          ? Colors.blue
                          : const Color.fromARGB(255, 57, 55, 55),
                    ),
                  ),
                  onTap: () {
                    _changeColorAfterTap(1);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_time_filled_rounded,
                    color: isPengingatAdded ? Colors.blue : null,
                  ),
                  title: Text(
                    'Waktu & Pengingat',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: isPengingatAdded
                          ? Colors.blue
                          : const Color.fromARGB(255, 57, 55, 55),
                    ),
                  ),
                  onTap: () {
                    _changeColorAfterTap(2);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// git config --global user.email "contoh@gmail.com"
// git add .
// git commit -m "commitan pertamaku"
// git branch -M main
