import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                Text("Edit Profile",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 19.0)),
              ],
            )),
        body: ProfileContent(),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  String imageUrl = 'https://randomuser.me/api/portraits/men/1.jpg';
  TextEditingController usernameController =
      TextEditingController(text: 'username');
  TextEditingController emailController = TextEditingController(text: 'email');
  TextEditingController passwordController =
      TextEditingController(text: 'password');
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.blue[50],
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 91, 169, 253),
                    radius: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_enhance_rounded,
                        color: Color.fromARGB(255, 245, 248, 254),
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            // Buat terlebih dahulu sebuah TextEditingController

// Widget untuk menampilkan label di dalam text field
            SizedBox(
              width: 335,
              height: 45, // Set the desired height
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Nama Pengguna',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.blue[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),
            SizedBox(
              width: 335,
              height: 45,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.blue[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 335,
              height: 45,
              child: TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.blue[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 335,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to delete the profile here
                    // For demonstration purposes, I'll just show a message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hapus Profile'),
                          content: Text(
                              'Are you sure you want to delete your profile?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Add functionality to delete the profile here
                                // For demonstration purposes, let's just close the dialog
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[50],
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text('Hapus Akun'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
