import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:liveeasy_internship_assign/profile_selection.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({Key? key, required this.phoneNo}) : super(key: key);
  PhoneNumber phoneNo;
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDRecived = "";
  String genPin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verify Number',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 10,
              ),
              Text(
                'Code is sent to ${widget.phoneNo.number}',
                style: TextStyle(fontSize: 18.0, color: Colors.grey.shade400),
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (pin) => {genPin = pin},
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2E3B62),
                ),
                onPressed: () {
                  //TODO: verify number
                  verifyNumber(widget.phoneNo);
                  verifyOtp(genPin);
                },
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Selection()));},
                  child: Container(
                    height: 60,
                    width: 370,
                    child: const Center(
                      child: Text(
                        'Verify Phone Number',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void verifyNumber(phoneNoo){
    auth.verifyPhoneNumber(phoneNumber: phoneNoo,
        verificationCompleted: (PhoneAuthCredential credential){
          auth.signInWithCredential(credential).then((value)=>{
            print("You are loggged in successfully")
          });
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception.message);
        },
        codeSent: (String verificationID,int? resendToken){
          verificationIDRecived = verificationID;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationID){}
    );
  }

  void verifyOtp(pinn) async{
    PhoneAuthCredential credential =   PhoneAuthProvider.credential(verificationId: verificationIDRecived, smsCode: pinn.text);
    await auth.signInWithCredential(credential).then((value){
      print("You are logged in successfully");
    });
  }
}


