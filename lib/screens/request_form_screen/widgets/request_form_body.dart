import 'package:e_service_app/components/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class RequestFormBody extends StatelessWidget {
  const RequestFormBody({
    Key key,
    @required this.labels,
    @required List<TextEditingController> controller,
    @required this.validators,
  })  : _controller = controller,
        super(key: key);

  final List<String> labels;
  final List<TextEditingController> _controller;
  final List<bool> validators;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 39, 56, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
          ),
          for (var i = 0; i < labels.length; i++)
            Container(
              child: CustomerTextField(
                controller: _controller[i],
                lines: i == 0 ? 5 : 1,
                labelText: labels[i],
                validate: validators[i],
              ),
            ),
        ],
      ),
    );
  }
}
