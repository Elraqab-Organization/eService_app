import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 39, 56, 1),
              ),
              child: ListView.builder(
                padding:
                    EdgeInsets.only(top: height * 0.30, right: 20, left: 20),
                itemCount: 5,
                itemBuilder: (context, index) => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 56.0,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              trailing: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.green,
                              ),
                              title: TextComponent(
                                title: AppLocalizations.of(context).language,
                                fontSize: 14,
                                weight: FontWeight.w700,
                                textColor: Colors.black,
                                align: TextAlign.start,
                              ),
                              onTap: () {
                                setState(() {
                                  isSelected
                                      ? isSelected = false
                                      : isSelected = true;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 180, 20, 20),
                  child: Text(
                    'Languages',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            CustomReturnBar(),
          ],
        ),
      ),
    );
  }
}
