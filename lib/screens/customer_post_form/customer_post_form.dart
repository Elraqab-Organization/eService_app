// import 'package:e_service_app/components/custom_btn.dart';
// import 'dart:html';

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

  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                children: [_buildDescription(), _buildTagsField()],
              ))
        ],
      ),
    ));
  }

  Widget _buildTagsField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Tags(
        alignment: WrapAlignment.start,
        itemCount: tags.length,
        columns: 3,
        textField: TagsTextField(
            inputDecoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white),
            textStyle: TextStyle(fontSize: 14),
            onSubmitted: (string) {
              setState(() {
                if (tags.length == 3) {
                } else
                  tags.add(Item(title: string));
              });
            }),
        itemBuilder: (index) {
          final Item currentItem = tags[index];
          return ItemTags(
              index: index,
              customData: currentItem.customData,
              textStyle: TextStyle(fontSize: 14),
              combine: ItemTagsCombine.withTextAfter,
              removeButton: ItemTagsRemoveButton(onRemoved: () {
                setState(() {
                  tags.removeAt(index);
                });
                return true;
              }),
              title: currentItem.title);
        },
      ),
    );
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
