import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_btn.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/post_provider/post_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerProposalForm extends StatefulWidget {
  @override
  _CustomerProposalFormState createState() => _CustomerProposalFormState();
}

class _CustomerProposalFormState extends State<CustomerProposalForm> {
  LoginViewmodel get _service => dependency();

  // global key for validation
  final formKey = GlobalKey<FormState>();

  TextEditingController description = new TextEditingController();
  TextEditingController fees = new TextEditingController();
  TextEditingController step1 = new TextEditingController();
  TextEditingController step2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postObj = ModalRoute.of(context).settings.arguments as Post;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomReturnBar(),
                _buildFee(),
                _buildDescription(),
                _buildStep1(),
                _buildStep2(),
                postBtn(postObj),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff212738),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            "Description :",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
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
        ),
      ],
    );
  }

  Widget _buildFee() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            "Fees :",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: TextFormField(
            controller: fees,
            validator: (String value) {
              if (value.isEmpty) {
                return 'fees is required';
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
                hintText: "25.00 RM",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
      ],
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            "Step 1:",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: TextFormField(
            controller: step1,
            validator: (String value) {
              if (value.isEmpty) {
                return 'step 1 is required';
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
                hintText: "write step 1 description",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            "Step 2 :",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: TextFormField(
            controller: step2,
            validator: (String value) {
              if (value.isEmpty) {
                return 'step description is required';
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
                hintText: "write step 2 description",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
      ],
    );
  }

  Widget postBtn(post) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OptionButton(
              width: 45,
              height: 45,
              color: Color(0xffF97068),
              icon: Icon(
                Icons.close,
                color: Colors.white,
              )),
          InkWell(
            onTap: () async {
              if (formKey.currentState.validate()) {
                final proposal = await context
                    .read(postProvider)
                    .createAProposal(post.id.toString(), {
                  'serviceProviderId': _service.user.id.toString(),
                  'diagnosisFee': fees.text,
                  'description': description.text,
                  'steps': [step1.text, step2.text]
                });

                if (proposal != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('post has been saved')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('failed to save post')));
                }
              }
            },
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
                  color: Color(0xffF97068),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
