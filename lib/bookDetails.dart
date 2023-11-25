import 'package:flutter/material.dart';

import 'book.dart';

class SecondPage extends StatelessWidget {
  Map<String, Book> bookDetails = {};

  @override
  Widget build(BuildContext context) {
    bookDetails =
    ModalRoute.of(context)?.settings.arguments as Map<String, Book>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details - Second Page'),
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
              '${bookDetails['bookObject']?.bookName}',
              style: TextStyle(
                  fontSize: 30.0
              ),
            ),
            SizedBox(height: 40,),
            Text('Book Author:',
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
            SizedBox(height: 20,),
            Text(
              '${bookDetails['bookObject']?.bookAuthor}',
              style: TextStyle(
                  fontSize: 30.0
              ),
            ),
            SizedBox(height: 40,),

            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '/buyNow',
                        arguments: {
                          'bookObject': bookDetails['bookObject'],
                        });
                  },
                  label: const Text('Buy Now!'),
                ),
                SizedBox(width: 40,),
                ElevatedButton.icon(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text('Go back!'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
