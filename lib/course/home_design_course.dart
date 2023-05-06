import 'package:best_flutter_ui_templates/course/category_list_view.dart';
import 'package:best_flutter_ui_templates/course/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import '../comman/design_course_app_theme.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Course extends StatefulWidget {
  @override
  _Course createState() => _Course();
}

class _Course extends State<Course> {
  int _currentIndex = 1;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    getAppBarUI(),
                    getSearchBarUI(),
                    getCategoryUI(),
                    StickyHeader(
                      header: Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 16, right: 16),
                              child: Text(
                                'My Courses',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  letterSpacing: 0.27,
                                  color: Color(0xff073278),
                                ),
                              ),
                            ),
                            CategoryListView(
                              callBack: () {
                                moveTo();
                              },
                            ),
                          ],
                        ),
                      ),
                      content: Container(
                        height: 500,
                        child: Column(
                          children: <Widget>[
                            Flexible(
                              child: getPopularCourseUI(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Explore Courses',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Color(0xff073278),
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    // Navigator.push<dynamic>(
    //   context,
    //   MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => CourseInfoScreen(),
    //   ),
    // );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                if (_currentIndex == 1) ...[
                  TextButton(
                    child: Text(
                      "Coaching",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(1),
                  ),
                ] else ...[
                  TextButton(
                    child: Text(
                      "Coaching",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(1),
                  ),
                ],
                const SizedBox(
                  width: 16,
                ),
                if (_currentIndex == 2) ...[
                  TextButton(
                    child: Text(
                      "Goalkeeping",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(2),
                  ),
                ] else ...[
                  TextButton(
                    child: Text(
                      "Goalkeeping",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(2),
                  ),
                ],
                const SizedBox(
                  width: 16,
                ),
                if (_currentIndex == 3) ...[
                  TextButton(
                    child: Text(
                      "Explore_Courses",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(3),
                  ),
                ] else ...[
                  TextButton(
                    child: Text(
                      "Explore_Courses",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff073278)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xff073278))),
                      ),
                    ),
                    onPressed: () => onTappedBar(3),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Hind',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff073278),
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Courses',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: Color(0xff073278),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
