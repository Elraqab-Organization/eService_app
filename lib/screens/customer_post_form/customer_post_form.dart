// import 'package:e_service_app/components/custom_btn.dart';
// import 'dart:html';

import 'package:e_service_app/components/custom_btn.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
// import 'package:e_service_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
// import 'package:http/http.dart' as http;

class CustomerPostForm extends StatefulWidget {
  @override
  _CustomerPostFormState createState() => _CustomerPostFormState();
}

class _CustomerPostFormState extends State<CustomerPostForm> {
  //
  String description;
  String cancelationFee;
  String location;

  List tags = [];
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();

  TextEditingController _tagsController = new TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomReturnBar(),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Make a post now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _globalKey,
                child: Column(
                  children: [_buildDescription()],
                )),
            if (tags.length != 4)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 200,
                      child: TextFormField(
                        controller: _tagsController,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            hintText: "Enter tags",
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!tags.contains(_tagsController.text))
                        setState(() {
                          tags.add(_tagsController.text);
                        });
                    },
                    child: OptionButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: 50,
                child: tags.length != 0
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          return tagChip(
                              tagTitle: tags[index],
                              onTap: () => _removeTag(tags[index]));
                        })
                    : Text("No Tags found"),
              ),
            )
          ],
        ),
      ),
    );
  }

  _removeTag(tagTitle) async {
    if (tags.contains(tagTitle)) {
      setState(() {
        tags.remove(tagTitle);
      });
    }
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Description is required';
          }
          return null;
        },
        onSaved: (String value) {
          value = description;
        },
        maxLines: 9,
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(10),
            ),
            hintText: "Write post description",
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _buildCancelationFee() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'cancelation fee is required';
          }
          return null;
        },
        onSaved: (String value) {
          value = cancelationFee;
        },
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(10),
            ),
            hintText: "cancelation fee",
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _buildLocation() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'location is required';
          }
          return null;
        },
        onSaved: (String value) {
          value = location;
        },
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(10),
            ),
            hintText: "location",
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget tagChip({tagTitle, onTap}) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  '$tagTitle',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.orange.shade600,
                radius: 8.0,
                child: Icon(
                  Icons.clear,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  // Future<Post> createPost() async {
  //   //
  //   final String baseUrl = "http://localhost:5000/posts/";
  //   final response = await http.post(
  //     Uri.parse('$baseUrl'),
  //     body: json.encode({
  //       "description": "hello  o am knjsfsdf",
  //       "paymentMethod": "online",
  //       "cancelationFee": "120",
  //       "location": "good",
  //       "tags": "gggg",
  //       "imgSrc": "imgSrc",
  //       "customerId": "60dae3bcdfbb690d0036d4d9"
  //     }),
  //     headers: {"Content-Type": "application/json"},
  //   );

  //   print(response);
  // }
}
