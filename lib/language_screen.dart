import 'package:flutter/material.dart';
import 'package:liveeasy_internship_assign/mobile_number_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String dropdownValue = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 100,
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Please select your Language",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "You can change the language at anytime",
              style: TextStyle(fontSize: 18.0,color: Colors.grey.shade400),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 60,
              width: 270,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 0.80),
              ),
              child: Center(
                child: DropdownButton<String>(
                  // Step 3.
                  value: dropdownValue,
                  // Step 4.
                  items: <String>['English', 'Hindi', 'German', 'French']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        height: 50.0,
                        width: 200.0,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobileNumber()));
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
