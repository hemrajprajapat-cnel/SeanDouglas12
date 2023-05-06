// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_flutter_ui_templates/activity/comment.dart';
import 'package:best_flutter_ui_templates/api/api.dart';
import 'package:best_flutter_ui_templates/comman/custome_dialog.dart';
import 'package:best_flutter_ui_templates/library/course_info_screen.dart';
import 'package:best_flutter_ui_templates/library/models/category.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../comman/design_course_app_theme.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:http/http.dart' as http;

class Library extends StatefulWidget {
  @override
  _Library createState() => _Library();
}

class _Library extends State<Library> with TickerProviderStateMixin {
  int _currentIndex = 1;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  AnimationController? animationController;
  final scrollController = ScrollController();
  var isLoading = false;
  int page = 1;
  var commentType = "L";
  var _isLiked = false;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
    scrollController.addListener(scrollPagination);
    libraryGetList(context, page);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  List<LibraryGetList> libraryList = [];
  List<LibraryGetList> tempLibraryList = [];

  Future<void> libraryGetList(
    BuildContext context,
    page,
  ) async {
    List<LibraryGetListResponse>? libraryGetListResponse;
    isLoading = true;
    final url = baseUrl + ApiEndPoints().libraryGetList;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getInt('isUserId');

    var response =
        await http.get(Uri.parse("$url&user_id=$user_id&page=$page"));
    isLoading = false;

    if (response.statusCode == 200) {
      List<LibraryGetListResponse> libraryGetListResponse = [];
      List<LibraryGetList> libraryGetList = [];
      libraryGetListResponse
          .add(LibraryGetListResponse.fromJson(jsonDecode(response.body)));
      LibraryGetListResponse userResponse = libraryGetListResponse[0];

      if (userResponse.status == "true" && userResponse.error_code == "0") {
        if (userResponse.libraryGetList != null) {
          var data = userResponse.libraryGetList;
          for (var e in data!) {
            libraryList.add(e);
          }
          setState(() {
            tempLibraryList = libraryList;
          });
        }
      }
    } else {
      customDialog(context, message: "Data not found", title: 'Error');
    }
  }

  void scrollPagination() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      page = page + 1;
      libraryGetList(context, page);
      setState(() {
        isLoading = false;
      });
    }
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
                controller: scrollController,
                child: Column(
                  children: [
                    getAppBarUI(),
                    StickyHeader(
                      header: Container(
                        child: getSearchBarUI(),
                      ),
                      content: Container(
                        // height: 950,
                        child: Column(
                          children: <Widget>[
                            getCategoryUI(),
                            // Flexible(
                            // child:
                            getPopularCourseUI(),
                            // ),
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

  Widget PopularCourseListView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(parent: null),
                itemCount: tempLibraryList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < tempLibraryList.length) {
                    final int count = tempLibraryList.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController?.forward();

                    LibraryGetList librarylist = tempLibraryList[index];

                    RegExp exp = RegExp(r"<[^>]*>",
                        multiLine: true, caseSensitive: true);
                    String content = librarylist.content!.replaceAll(exp, '');
                    bool _like_c_user = librarylist.like_c_user == true;

                    return AnimatedBuilder(
                      animation: animationController!,
                      builder: (BuildContext context, Widget? child) {
                        return FadeTransition(
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, 50 * (0.5 - animation.value), 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              // onTap: callback,
                              child: SizedBox(
                                // height: 250,
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: <Widget>[
                                    Container(
                                        child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                ),

                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    "${librarylist.author_image}",
                                                  ),
                                                ),

                                                // CircleAvatar(
                                                //   radius: 20,
                                                //   child: Image(
                                                //     image: NetworkImage(
                                                //       "${librarylist.author_image}",
                                                //     ),
                                                //     fit: BoxFit.fill,
                                                //   ),
                                                // ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          "${librarylist.user_name}",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff073278)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    "25/02/2022",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xff073278)),
                                                  ),
                                                ),
                                              ]),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: AutoSizeText(
                                              content,
                                              textAlign: TextAlign.left,
                                              minFontSize: 15,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                height: 1.2,
                                                color: Color(0xff073278),
                                              ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(12),
                                                child: Image(
                                                  image: NetworkImage(
                                                    'https://readyforyourreview.com/SeanDouglas12/wp-content/uploads/2021/08/OFC-Learn-Gradient-Filled-Horizontal-1536x842.png',
                                                  ),
                                                  width: 300,
                                                  height: 180,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            // IconButton(
                                            //   onPressed: () async {
                                            //     setState(() {
                                            //       if (_isLiked) {
                                            //         _isLiked = false;
                                            //       } else {
                                            //         _isLiked = true;
                                            //       }
                                            //       activityLikePostList(
                                            //         context,
                                            //         _isLiked,
                                            //         librarylist.id,
                                            //       );
                                            //     });
                                            //   },
                                            //   icon: _like_c_user == true
                                            //       ? Icon(
                                            //           Icons.favorite,
                                            //           color: Colors.red,
                                            //         )
                                            //       : Icon(
                                            //           Icons.favorite,
                                            //           color: Color(0xff073278),
                                            //         ),
                                            //   iconSize: 30.0,
                                            // ),

                                            // LikeButton(
                                            //   onTap: (isLiked) {
                                            //     return activityLikePostList(
                                            //       context,
                                            //       isLiked,
                                            //       librarylist.id,
                                            //     );
                                            //     setState(() {
                                            //       _like_c_user = _like_c_user;
                                            //     });
                                            //   },
                                            //   padding:
                                            //       EdgeInsets.only(left: 10),
                                            //   likeBuilder: (bool _like_c_user) {
                                            //     return Icon(
                                            //       Icons.favorite,
                                            //       color: _like_c_user
                                            //           ? Colors.red
                                            //           : Color(0xff073278),
                                            //     );
                                            //   },
                                            // ),

                                            IconButton(
                                              icon: const Icon(
                                                Icons.comment_outlined,
                                              ),
                                              onPressed: () => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Postcomment(
                                                            librarylist.id,
                                                            commentType),
                                                  ),
                                                ),
                                              },
                                              color: Color(0xff073278),
                                            ),
                                            Text(
                                              "${librarylist.totel_comment}",
                                              style: TextStyle(
                                                color: Color(0xff073278),
                                              ),
                                            )
                                          ]),
                                          // Column(
                                          //   children: [
                                          //     Container(
                                          //       padding: const EdgeInsets.only(
                                          //           left: 15, right: 15),
                                          //       child: Align(
                                          //         alignment:
                                          //             Alignment.centerLeft,
                                          //         child: Text(
                                          //           "${librarylist.like_count}",
                                          //           style: TextStyle(
                                          //             fontWeight:
                                          //                 FontWeight.w500,
                                          //             fontSize: 12,
                                          //             color: Color(0xff073278),
                                          //           ),
                                          //           overflow:
                                          //               TextOverflow.ellipsis,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                });
          }
        },
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
            'Browse Articles',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Color(0xff073278),
            ),
          ),
          // Flexible(
          // child:
          PopularCourseListView(
              // callBack: () {
              //   moveTo();
              // },
              ),
          // )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
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
                      "Administration",
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
                      "Administration",
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
                    onPressed: () => onTappedBar(2),
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
                    onPressed: () => onTappedBar(2),
                  ),
                ],
                const SizedBox(
                  width: 16,
                ),
                if (_currentIndex == 3) ...[
                  TextButton(
                    child: Text(
                      "Medical",
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
                      "Medical",
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
                const SizedBox(
                  width: 16,
                ),
                if (_currentIndex == 4) ...[
                  TextButton(
                    child: Text(
                      "Officials",
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
                    onPressed: () => onTappedBar(4),
                  ),
                ] else ...[
                  TextButton(
                    child: Text(
                      "Officials",
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
                    onPressed: () => onTappedBar(4),
                  ),
                ],
              ],
            ),
          ),
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
                            labelText: 'Search for keywords or topics',
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
      padding:
          const EdgeInsets.only(top: 8.0, left: 18, right: 18, bottom: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Library',
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
          // Container(
          //   width: 45,
          //   height: 45,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Addpost("Library"),
          //         ),
          //       );
          //     },
          //     child: const Icon(
          //       Icons.edit_sharp,
          //     ),
          //     backgroundColor: Color(0xFF063278),
          //   ),
          // )
        ],
      ),
    );
  }
}
