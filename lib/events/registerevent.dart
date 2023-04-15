import 'package:flutter/material.dart';

class Registerevent extends StatefulWidget {
  @override
  _Registerevent createState() => _Registerevent();
}

class _Registerevent extends State<Registerevent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 203, 203),
        appBar: AppBar(
          backgroundColor: Color(0xFF063278),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
              child: SingleChildScrollView(
                child: Container(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Event Registration Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff073278),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'In order to process your registration, we ask you to provide the following information. Please note that all fields marked with an asterisk (*) are required.',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff073278),
                                      ),
                                    ),
                                    Text(
                                      'Qty',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff073278),
                                      ),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff073278),
                                      ),
                                    ),
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff073278),
                                      ),
                                    ),
                                  ]),
                                  TableRow(
                                    children: [
                                      Text('Jone'),
                                      Text('1'),
                                      Text('0.00'),
                                      Text('0.00 '),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, left: 15, right: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Event Registration Summary',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff073278),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: TextStyle(),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.person),
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Username",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: TextStyle(),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "password",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          minimumSize:
                                              const Size.fromHeight(50),
                                          backgroundColor: Color(0xff66C23D),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
