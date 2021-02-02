import 'package:flutter/material.dart';

import 'callback.dart';



class FormWork extends StatefulWidget {

  final Function(String,String,String) onFunctionChange;


  FormWork({@required this.onFunctionChange});

  @override
  _FormWorkState createState() => _FormWorkState();
}

class _FormWorkState extends State<FormWork> {

  String allValue="abc";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _password = '';
  bool usernameValid = true;
  bool usernameValid1 = true;
  bool usernameValid2 = true;


  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_userName);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        color: Colors.black,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      onChanged: (val) {
                        setState(() {
                          usernameValid1 =
                              _nameController.text.isNotEmpty &&
                                  validateName(val);
                        });
                      },
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "abc",
                        contentPadding: const EdgeInsets.all(4),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: usernameValid1
                              ? (_nameController.text.isNotEmpty
                              ? Colors.blueAccent
                              : Colors.deepOrange)
                              : Colors.red,
                        ),
                        suffixIcon: !usernameValid1
                            ? Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        )
                            : null,
                      ),

                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          usernameValid =
                              _emailController.text.isNotEmpty &&
                                  validateEmail(val);
                        });
                      },
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "example@mail.com",
                        contentPadding: const EdgeInsets.all(4),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: usernameValid
                              ? (_emailController.text.isNotEmpty
                              ? Colors.blueAccent
                              : Colors.deepOrange)
                              : Colors.red,
                        ),
                        suffixIcon: !usernameValid
                            ? Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        )
                            : null,
                      ),
                    ),
                    TextFormField(
                      controller: _numbercontroller,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          usernameValid =
                              _numbercontroller.text.isNotEmpty &&
                                  validateNumber(val);
                        });
                      },
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "+880",
                        contentPadding: const EdgeInsets.all(4),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: usernameValid2
                              ? (_numbercontroller.text.isNotEmpty
                              ? Colors.blueAccent
                              : Colors.deepOrange)
                              : Colors.red,
                        ),
                        suffixIcon: !usernameValid2
                            ? Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        )
                            : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    /*Container(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                            onPressed: _trySubmitForm,
                            child: Text('Sign Up'))),*/
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text("Save",style: TextStyle(fontSize: 18,color: Colors.white),),
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.of(context).pop();
                          widget.onFunctionChange(_nameController.text,_emailController.text,_numbercontroller.text);
                        },

                      ),
                    )

                  ],

                ),

              ),

            ),
          ),
        ),

      ),

    );
  }

  bool validateEmail(String val) =>
      RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(val);


  bool validateName(String val) =>
      RegExp(r"(\w+)")
          .hasMatch(val);

  bool validateNumber(String val) =>
      RegExp(
          "/\d?(\s?|-?|\+?|\.?)((\(\d{1,4}\))|(\d{1,3})|\s?)(\s?|-?|\.?)((\(\d{1,3}\))|(\d{1,3})|\s?)(\s?|-?|\.?)((\(\d{1,3}\))|(\d{1,3})|\s?)(\s?|-?|\.?)\d{3}(-|\.|\s)\d{4}/")
          .hasMatch(val);
}