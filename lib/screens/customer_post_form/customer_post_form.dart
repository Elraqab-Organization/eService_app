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
  String paymentMethod = "cash";
  String location = "Johor";
  List tags = [];
  final GlobalKey<TagsState> _globalKey = GlobalKey<TagsState>();

  TextEditingController _tagsController = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController cancelationFee = new TextEditingController();
  TextEditingController imgSrc = new TextEditingController();
  TextEditingController customerId = new TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomReturnBar(),
              Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      _buildDescription(),
                      _buildpaymentMethod(),
                      _buildCancelationFee()
                    ],
                  )),
              if (tags.length != 4)
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 10, top: 30),
                  child: Row(
                    children: [
                      Container(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
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
                        ),
                      )
                    ],
                  ),
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
                      : Text(""),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: OptionButton(
                          color: Colors.black,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          width: 45,
                          height: 45,
                        ),
                      ),
                      postBtn()
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0xffF97068),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xffEDF2EF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
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
        controller: description,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Description is required';
          }
          return null;
        },
        maxLines: 6,
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

  Widget _buildpaymentMethod() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white))),
              value: paymentMethod,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              iconSize: 24,
              elevation: 5,
              style: const TextStyle(color: Colors.black),
              onChanged: (String newValue) {
                setState(() {
                  paymentMethod = newValue;
                });
              },
              items: <String>['cash', 'online payment']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            width: 150,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white))),
              value: location,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (String newValue) {
                setState(() {
                  location = newValue;
                });
              },
              items: <String>['Johor', 'online payment']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelationFee() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
      child: TextFormField(
        controller: cancelationFee,
        validator: (String value) {
          if (value.isEmpty) {
            return 'cancelation fee is required';
          }
          return null;
        },
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(10),
            ),
            hintText: "write cancelation fee",
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

  Widget postBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 110,
          height: 50,
          child: Center(
              child: Text(
            "Post",
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
