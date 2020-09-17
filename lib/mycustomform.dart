// Define a custom Form widget.
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final textFieldController = TextEditingController();
  String textFromField = '';

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textFieldController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'My custom Form',
        ),
      ),
      body: _formBuilder(context),
    );
  }

  Widget _formBuilder(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _textFormField(context),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _submitButton(context)),
          Text(textFromField),
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false
        // otherwise.
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a Snackbar.
          setState(() {
            textFromField = textFieldController.text;
          });
          //print(textFieldController.text);
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Submit'),
    );
  }

  Widget _textFormField(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      validator: (value) {
        if (value.isEmpty) {
          print(value);
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  _printLatestValue() {
    print("Second text field: ${textFieldController.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }
}
