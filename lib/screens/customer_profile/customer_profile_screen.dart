import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  double height = 350;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(24.0),
              height: widget.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 112, 102, 1),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          child: Icon(
                            FontAwesomeIcons.edit,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {},
                      ),
                      InkWell(
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          child: Icon(
                            FontAwesomeIcons.bell,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "Ahmed Mousa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 30),
                  child: Text(
                    "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.mapMarked),
                        title: Text("My Address"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.userCircle),
                        title: Text("Account"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(24.0),
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey,
                        blurRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.bell),
                        title: Text("Notification"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.userLock),
                        title: Text("Privacy and security"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.key),
                        title: Text("Password"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.language),
                        title: Text("Language"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.creditCard),
                        title: Text("Payment"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.headset),
                        title: Text("Help and support"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.questionCircle),
                        title: Text("About"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(24.0),
                  margin: EdgeInsets.fromLTRB(40, 15, 40, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey,
                        blurRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
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
