import 'package:flutter/material.dart';

class Termsofservice extends StatefulWidget {
  const Termsofservice({Key? key}) : super(key: key);

  @override
  _Termsofservice createState() => _Termsofservice();
}

class _Termsofservice extends State<Termsofservice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(241, 243, 241, 243),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Terms of Service',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff073278),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Thank you for reading our Terms of Use. By accessing OFC Learn, you agree that you have read, understood and agree to these Terms of Use which incorporates our Acceptable Use Policy and our Privacy Policy. If at any time you do not agree with any of our Terms of Use, you must not use OFC Learn or any related services.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '1  Our services',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '1.1 OFC Learn is an online platform owned and operated by Oceania Football Confederation (“OFC”, “we”, “us” and “our”). Your use of OFC Learn and related services is governed by these Terms of Use, and by accessing or using OFC Learn you, as a user, agree to be bound by the terms contained herein.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '1.2 OFC Learn makes available education, qualification management and support information services (“Services”), including the following:',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Online courses or programs;',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Webinars;',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Tutorials;',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Resources;',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Articles;',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Workbooks; and',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\u2022 Chat forums.',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '1.3 If you choose to use the OFC Learn you must observe the Acceptable Use Policy  Any breach of the Acceptable Use Policy may result in your OFC Learn account being suspended or terminated.',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2  Access and Use of OFC Learn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2.1 You may access OFC Learn once you have registered with an account with us and we have issued you your login credentials.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2.2 You may access OFC Learn if you 16 years of age or over.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2.3 We may require you to provide us with certain information before we can complete your OFC Learn registration. Your privacy is important to us and we are committed to respecting your privacy rights. We will always deal with your personal information in accordance with applicable privacy law and our Privacy Policy  By submitting your personal information to us, or by otherwise using OFC Learn, you consent to our collection and use of personal data as outlined in our Privacy Policy.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2.4 You must notify us if any of your information provided to us changes. You must not share your account or password with anyone and are fully responsible for all use of your account.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2.5 The use of OFC Learn is solely for your personal use and non- commercial use. With your access to OFC Learn we grant you a limited, non- exclusive, non-transferable, licence to access the online resources and content made available by us on OFC Learn. OFC may revoke your licence at any time in its sole discretion. Upon revocation, you must promptly destroy all content downloaded or otherwise obtained through the service, as well as copies of such materials.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3  Access Fee',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.1 We may charge you a fee to access OFC Learn. Additional fees may be payable for certain Services, such as online courses, webinars or video tutorials. All fees are payable by you prior to accessing OFC Learn or the corresponding Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.2 Payment can be paid securely online via our payment page. OFC does not have access to your payment details.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.3 All purchases are non-transferable and once purchased only that user will have the right to access that Service.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.4 All fees are non-refundable, regardless of whether:',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.4.1the user withdraws from the Services;',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.4.2 the user does not attend or complete the relevant purchase; or',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.4.3 the purchase is not within the user’s expectation or intended use.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '3.5 Unless otherwise stated all prices are stated in New Zealand dollars and are exclusive of taxes (including goods and services taxes or similar charges in your jurisdiction). You are solely responsible for taxes payable.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '4  Use of Cookies',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '4.1 OFC Learn may use “cookies” to help us identify you when you use our website or to help us improve your experience when using the Services. If you do not accept our cookies, some pages may not operate as intended and you may not be able to access certain information on our website.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5  Intellectual Property',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.1 We are the owner or the licensee of all intellectual property rights in respect of OFC Learn, the material published on OFC Learn or as otherwise made available you in connection with the Services. Those works are protected by copyright laws and treaties around the world. All such rights are reserved by us.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.2 You may print off one copy of any resource that you have validly accessed and you may download permitted resources solely for your personal use.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.3 You must not otherwise:',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.3.1 copy, reproduce, republish, or distribute any content from us (in any form), for any reason whether in public, for commercial purposes or otherwise;',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.3.2 use, reproduce, duplicate, reverse assemble, reverse engineer, modify, alter, adapt, disassemble, decompile or amend any such intellectual property rights or any of the underlying materials in any way, whether directly or indirectly; or ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '5.3.3 assert ownership or rights in, or exploit, sell or seek to generate profit from any of our intellectual property rights in OFC Learn or the Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '5.4 If you print off, copy or download any information or materials in breach of these Terms of Use, your right to use OFC Learn will cease immediately and you must, at our option, return or destroy all copies of such materials.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '5.5 If you load some material onto OFC Learn, you grant us a license for all intellectual property for all uses of OFC Learn.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6  Liability',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.1 You acknowledge that the content and resources provided as part of the Services may not be provided by OFC but may be from a number of third party sources. Although we make reasonable efforts to update the information on OFC Learn you understand that errors can occur, or information may change over time. OFC Learn is provided on an “as-is” and “as-available” basis and we may suspend access to OFC Learn, or close it indefinitely, at any time. We will not be liable to you if for any reason our site is unavailable at any time or for any period.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.2 To the extent permitted by law, and except as otherwise provided for in these Terms of Use, we make no representations, conditions or warranties of any kind with respect to OFC Learn and the Services. We make no representation as to the accuracy, completeness, or reliability of the information provided in connection with the Services and are not liable for any:',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.3.1 errors, mistakes or inaccuracies;',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.3.2 action you take, or fail to take, including where you have done so in reliance on information contained on OFC Learn or referred to by us;',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.3.3 personal injury or property damage of any kind resulting from your access or use of the Services; and',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.3.4 interruption of your use of the website or our Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '6.4 To the fullest extent permitted by law, OFC will not be liable in contract, tort (including negligence) or otherwise to you for any direct, indirect or consequential loss or damage arising out of or in connection with the Services, including (without limitation) loss or damage you might suffer.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '7  Disclaimer of Warranties',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '7.1 OFC Learn is provided on a “as is” and “as available” basis. We make no warranty that your use of OFC Learn will be uninterrupted, timely, secure, or error-free, or that the Services will be accurate, complete or fit for your intended purpose.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '7.2 To the extent permitted by law, and except as otherwise provided for in these Terms of Use, we make no representations, conditions or warranties of any kind.5',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '8  Indemnity',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '8.1 You shall indemnify, and hold harmless, OFC, its agents, affiliates, directors, officers and employees from and against any and all third party claims, liabilities, losses and expenses (including actual legal costs), arising out of or in connection with your use of OFC Learn and reliance on the Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '9  General',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '9.1 These Terms of Use constitute the entire agreement between both of us with respect to your use of our Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '9.2 Regardless of where you are in the world, these Terms of Use are governed by and to be interpreted in accordance with the laws of New Zealand. You and we agree to the non-exclusive jurisdiction of the New Zealand courts.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '9.3 We may amend these Terms of Use from time to time and will notify you of any changes by posting an updated version on OFC Learn website. It is your responsibility to check periodically for any updates and your continued use of the Services following any such changes constitutes acceptance of the Terms of Use as amended. If you do not agree to any amendments to the Terms of Use, you must tell us and immediately cease all use of OFC Learn and the Services.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '9.4 Any delay or failure to enforce our rights under these Terms of Use does not mean we have waived those rights.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '10  OFC Learn Terms of Use',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'These Terms of Use are valid from 9 September 2021.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _Gender();
}

class _Gender extends State<Gender> {
  String dropdownValue = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(
          color: Color.fromARGB(255, 42, 41, 41),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Gender', 'Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                value,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _Country();
}

class _Country extends State<Country> {
  String dropdownValue = 'Country';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(
          color: Color.fromARGB(255, 42, 41, 41),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Country',
          'Afghanistan',
          'Albania',
          'Algeria',
          'Andorra',
          'India',
          'USA',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.only(right: 170),
              child: Text(
                value,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Regional extends StatefulWidget {
  const Regional({Key? key}) : super(key: key);

  @override
  State<Regional> createState() => _Regional();
}

class _Regional extends State<Regional> {
  String dropdownValue = 'Regional';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(
          color: Color.fromARGB(255, 42, 41, 41),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Regional',
          'FJ',
          'NC',
          'NZ',
          'PF',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.only(right: 190),
              child: Text(
                value,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DOB extends StatefulWidget {
  DOB({Key? key}) : super(key: key);

  @override
  _DOB createState() => _DOB();
}

class _DOB extends State<DOB> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Color(0xff28C0D6),
            ),
            onPressed: () => _selectDate(context),
            child: Text('Select date of birth'),
          ),
        ],
      ),
    );
  }
}
