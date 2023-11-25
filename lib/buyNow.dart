import 'package:flutter/material.dart';

import 'book.dart';

class BuyNow extends StatelessWidget {
  Map<String, Book?> bookDetails = {};
  List<String> paymentOptions= ['Bkash', 'Visa', 'Rocket', 'AmEx', 'MasterCard'];

  @override
  Widget build(BuildContext context) {
    bookDetails =
    ModalRoute.of(context)?.settings.arguments as Map<String, Book?>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment - Third Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name:',
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
            SizedBox(height: 20,),
            Text(
              '${bookDetails['bookObject']?.bookName} \nPrice: BDT 200',
              style: TextStyle(
                  fontSize: 30.0
              ),
            ),

            SizedBox(height: 40,),

            Divider(height: 30, color: Colors.black, indent: 5, endIndent: 5, thickness: 0.7,),
            Text('Payment Options',
              style: TextStyle(
                  fontSize: 30.0
              ),
            ),
            SizedBox(height: 40,),

            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(onPressed: () {},
                    child: const Text('BKash'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {},
                    child: const Text('Rocket'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {},
                    child: const Text('Visa'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {},
                    child: const Text('AmEx'),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {},
                    child: const Text('MasterCard'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paymentOptions.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text("${paymentOptions[index]}")
                      ),
                    );
                  }),
            ),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.popUntil(context, (Route route) => route.settings.name == '/');
            },
                child: Text("Home")),

          ],
        ),
      ),
    );
  }
}
