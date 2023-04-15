import 'package:flutter/material.dart';

class CPDpoint extends StatefulWidget {
  @override
  _CPDpoint createState() => _CPDpoint();
}

class _CPDpoint extends State<CPDpoint> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF063278),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Image.asset('assets/images/logo.png',
                      width: 100, height: 55, fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              "CPD Point",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff073278),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 40,
                                left: 15,
                                right: 15,
                                bottom: 40,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/userImage.png'),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff073278),
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Coaching CPD Points",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "You have not earned anything yet.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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
