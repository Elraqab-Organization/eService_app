import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  final double height = 350;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LoginViewmodel get _userSession => dependency();

  @override
  Widget build(BuildContext context) {
    print(_userSession.user);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(_userSession.user.imgSrc),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    _userSession.user.firstName +
                        " " +
                        _userSession.user.lastName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 15, 50, 30),
                  child: Text(
                    "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24.0),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey[300],
                        offset: Offset(0, 5),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.mapMarked),
                        title: Text("My Address"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/MyAddress');
                        },
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.userCircle),
                        title: Text("Account"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/AccountInfo');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24.0),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey[300],
                        offset: Offset(0, 5),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.bell),
                        title: Text("Notification"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/ProfileNotification');
                        },
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
                        onTap: () {
                          Navigator.pushNamed(context, '/PasswordReset');
                        },
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.language),
                        title: Text("Language"),
                        trailing: Icon(
                          FontAwesomeIcons.angleRight,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/changeLanguage');
                        },
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
