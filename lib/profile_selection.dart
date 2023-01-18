import 'package:flutter/material.dart';

enum Shippingdetails { shipper, transporter }

class Profile_Selection extends StatefulWidget {
  const Profile_Selection({Key? key}) : super(key: key);

  @override
  State<Profile_Selection> createState() => _Profile_SelectionState();
}

class _Profile_SelectionState extends State<Profile_Selection> {
  Shippingdetails? detail = Shippingdetails.shipper;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please select you profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  )
                ),
                child: RadioListTile<Shippingdetails>(
                  title: Row(
                    children: [
                      Icon(Icons.house_outlined,size: 70,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Shipper',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                          Text('lorem ipsum bla bla blaaa bla',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.left,),
                        ],
                      )
                    ],
                  ),
                  value: Shippingdetails.shipper,
                  groupValue: detail,
                  onChanged: (Shippingdetails? value) {
                    setState(() {
                      detail = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    )
                ),
                child: RadioListTile<Shippingdetails>(
                  title: Row(
                    children: [
                      Icon(Icons.fire_truck,size: 70,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Transporter',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                          Text('lorem ipsum bla bla blaaa bla',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey),textAlign: TextAlign.left,),
                        ],
                      )
                    ],
                  ),
                  value: Shippingdetails.transporter,
                  groupValue: detail,
                  onChanged: (Shippingdetails? value) {
                    setState(() {
                      detail = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2E3B62),
                ),
                onPressed: () {
                },
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Selection()));},
                  child: Container(
                    height: 60,
                    width: 370,
                    child: const Center(
                      child: Text(
                        'CONTINUE',
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
}
