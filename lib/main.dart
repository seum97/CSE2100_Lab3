import 'package:flutter/material.dart';

import 'book.dart';
import 'bookCard.dart';
import 'bookDetails.dart';
import 'buyNow.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => FirstPage(),
        '/bookDetails' : (context) => SecondPage(),
        '/buyNow': (context) => BuyNow(),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  var bookController = TextEditingController();
  var authorController = TextEditingController();
  bool crossVisible = false;
  final formKey = GlobalKey<FormState>();
  List<Book> bookList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List App - First Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: bookList.map((book) => BookCard(book: book)).toList(),
                ),
              ),
            ),

            // Expanded(
            //   flex: 2,
            //   child: ListView(
            //     children: [Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: bookList.map((book) => BookCard(book: book)).toList(),
            //     ),]
            //   ),
            // ),

            Container(
              height: 250,
              // flex: 2,
              child: Form(
                key: formKey,
                child: Column(
                    children: [
                      Divider(height: 30, color: Colors.black, indent: 5, endIndent: 5, thickness: 0.7,),

                      /// For Book Name ///
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: bookController,
                          onTap: () {
                            setState(() {
                              crossVisible = true;
                            });
                          },
                          onTapOutside: (PointerDownEvent event) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              crossVisible = false;
                            });
                          },
                          onFieldSubmitted: (text) {
                            setState(() {
                              crossVisible = false;
                            });
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please Enter Book Name !';
                            } else
                              return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            icon: Icon(Icons.book),
                            // hintText: "Enter Email",
                            border: OutlineInputBorder(),
                            label: Text(
                              'Enter Book Name',
                              style: TextStyle(fontSize: 20),
                            ),
                            suffixIcon: Visibility(
                              visible: crossVisible,
                              child: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  bookController.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///For Author ///
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: authorController,
                          onTap: () {
                            setState(() {
                              crossVisible = true;
                            });
                          },
                          onTapOutside: (PointerDownEvent event) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              crossVisible = false;
                            });
                          },
                          onFieldSubmitted: (text) {
                            setState(() {
                              crossVisible = false;
                            });
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter Author Name !';
                            } else
                              return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person_2),
                            // hintText: "Enter Email",
                            border: OutlineInputBorder(),
                            label: Text(
                              'Enter Author',
                              style: TextStyle(fontSize: 20),
                            ),
                            suffixIcon: Visibility(
                              visible: crossVisible,
                              child: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  authorController.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  bookList.insert(0, Book(bookName: bookController.text, bookAuthor: authorController.text));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Column(
                                          children: [
                                            Text('Hello User!!'),
                                            Text('Book Created Successfully !'),
                                          ],
                                        ),
                                      )
                                  );
                                });
                              }
                            },
                            child: Text("Submit")),
                      )
                    ]),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

