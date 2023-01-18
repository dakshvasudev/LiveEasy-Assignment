import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'otp_verification_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  PhoneNumber phoneNo = PhoneNumber(countryISOCode: 'IN', countryCode: '+91', number: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: (Icon(
            Icons.cancel_outlined,
            color: Colors.grey.shade400,
            size: 30.0,
          )
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please enter your mobile number",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "You'll recieve a code to verify next.",
              style: TextStyle(fontSize: 18.0,color: Colors.grey.shade400),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phoneNo = phone;
                  print(phone.completeNumber);
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2E3B62),
              ),
              onPressed: () {
                if(phoneNo.number!='') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          OtpVerificationScreen(phoneNo: phoneNo,)));
                }else{
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Please enter your phonenumber",
                    desc: "",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }
              },
              child: Container(
                height: 70,
                width: 250,
                child: Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
