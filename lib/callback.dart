import 'package:flutter/material.dart';
import 'package:form_validation_project/form_field.dart';
class FunctionCallBack extends StatefulWidget {


  @override
  _FunctionCallBackState createState() => _FunctionCallBackState();
}

class _FunctionCallBackState extends State<FunctionCallBack> {
  String name="abc";
  String email="abc@gmail.com";
  String phone="0195681236";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name??"enter your name",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
           Text(email??"please enter your email",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
           Text(phone??"please enter your phone number",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text("Update",style: TextStyle(fontSize: 18,color: Colors.white),),
                color: Colors.blueGrey,
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FormWork(onFunctionChange: (name,email,phone) {
                        setState(() {
                        this.name = name;
                        this.email = email;
                        this.phone = phone;


                        });
                      }),
                    ),
                  );

                },

              ),
            )


           /* FlatButton(onPressed: (){
              Navigator.pop(context);
              onFunctionChange("Fahmida");
            }, child: Text("name: Fahmida",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              color: Colors.blueGrey,
            ),
            FlatButton(onPressed: (){
              Navigator.pop(context);
              onFunctionChange("fahmida@gmail.com");
            }, child: Text("fahmida@gmail.com",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              color: Colors.blueGrey,
            ),
            FlatButton(onPressed: (){
              Navigator.pop(context);
              onFunctionChange("880195684128");
            }, child: Text("880195684128",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              color: Colors.blueGrey,
            )*/

          ],
        ),
      ),
    );
  }
}
