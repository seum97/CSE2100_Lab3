import 'package:flutter/material.dart';
import 'book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      color: Colors.grey[200],
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              book.bookName,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              book.bookAuthor,
              style: TextStyle(fontSize: 15.0),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/bookDetails',
                      arguments: {
                        'bookObject': book,
                      });
                },
                child: Text("Details"))
          ],
        ),
      ),
    );
  }
}
