import 'package:flutter/material.dart';

class Registerevent extends StatefulWidget {
  @override
  _Registerevent createState() => _Registerevent();
}

class _Registerevent extends State<Registerevent>
    with TickerProviderStateMixin {
  bool isChecked = false;
  String selectedCountry = 'Country';
  String selectedState = 'State/Province';
  String selectedEthnicity = 'Ethnicity';
  String selectedTShirtSize = 'T-Shirt Size';
  String selectedShortsSize = 'Shorts Size';
  String selectedJacketHoodieSize = 'Jacket / Hoodie Size';
  String selectedSockSize = 'Sock Size';
  String selectedAttendanceCourse =
      'Who will be paying for your attendance at the course?';

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
                                      Text(
                                          'Free Ticket: (For NZF JL3 Capital 2023)'),
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
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Attendee 1',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 5, 12, 24),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Personal Information',
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "First Name",
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Last Name",
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Email Address",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Note: Changes made in your Personal Information details will be synced with your user profile.',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 2, 5, 10),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Address Information',
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Address",
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Address2",
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
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "City",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedCountry,
                                        isExpanded: true,
                                        hint: Text('Country'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedCountry = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Country',
                                          'Canada',
                                          'New Zealand',
                                          'United States'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedState,
                                        isExpanded: true,
                                        hint: Text('State/Province'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedState = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'State/Province',
                                          'Alberta',
                                          'British Columbia',
                                          'Manitoba',
                                          'New Brunswick',
                                          'Newfoundland and Labrador',
                                          'Northwest Territories',
                                          'Nova Scotia',
                                          'Nunavut',
                                          'Ontario',
                                          'Prince Edward Island',
                                          'Quebec',
                                          'Saskatchewan',
                                          'Yukon',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: TextStyle(),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Zip/Postal Code",
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
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Phone Number",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'NZF Additional Questions ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff073278),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedEthnicity,
                                        isExpanded: true,
                                        hint: Text('Ethnicity'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedEthnicity = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Ethnicity',
                                          'Asian',
                                          'Maori',
                                          'NZ European',
                                          'Other',
                                          'Pacific Islander',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: TextStyle(),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText:
                                              "Medical / Dietary Requirements",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedTShirtSize,
                                        isExpanded: true,
                                        hint: Text('T-Shirt Size'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedTShirtSize = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'T-Shirt Size',
                                          'S',
                                          'M',
                                          'L',
                                          'XL',
                                          'XXL',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedShortsSize,
                                        isExpanded: true,
                                        hint: Text('Shorts Size'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedShortsSize = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Shorts Size',
                                          'S',
                                          'M',
                                          'L',
                                          'XL',
                                          'XXL',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedJacketHoodieSize,
                                        isExpanded: true,
                                        hint: Text('Jacket / Hoodie Size'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedJacketHoodieSize =
                                                newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Jacket / Hoodie Size',
                                          'Small',
                                          'Medium',
                                          'Large',
                                          'X Large',
                                          'XX Large',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedSockSize,
                                        isExpanded: true,
                                        hint: Text('Sock Size'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedSockSize = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Sock Size',
                                          'Small (US 3-5)',
                                          'Medium (US 6-8)',
                                          'Large (US 8-12)',
                                          'X Large (US 12-15)',                                     
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DropdownButton<String>(
                                        value: selectedAttendanceCourse,
                                        isExpanded: true,
                                        hint: Text('selectedAttendanceCourse'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedAttendanceCourse =
                                                newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Who will be paying for your attendance at the course?',
                                          'Myself',
                                          'My Club',                                         
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        style: TextStyle(),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText:
                                              "Club Payment - If you selected 'My Club' for the previous question, please provide your club name & a contact name, email and phone number",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 15, bottom: 20),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "I consent to OFC storing and using my personal information, according to their privacy policy.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        )
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
