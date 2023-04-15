import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_flutter_ui_templates/activity/addpost.dart';
import 'package:best_flutter_ui_templates/activity/comment.dart';
import 'package:best_flutter_ui_templates/activity/models/category.dart';
import 'package:best_flutter_ui_templates/activity/course_info_screen.dart';
import 'package:best_flutter_ui_templates/api/api.dart';
import 'package:best_flutter_ui_templates/comman/custome_dialog.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'design_course_app_theme.dart';
import 'package:http/http.dart' as http;


class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen>
    with TickerProviderStateMixin {
  int? value = 1;

  AnimationController? animationController;
  final scrollController = ScrollController();

  var isLoading = false;
  int page = 1;
  var commentType = "A";
  var _isLiked = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
    scrollController.addListener(scrollPagination);
    activityPostList(context, page);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1));
    return true;
  }

  ///////////// Activity API Calling ////////////
  List<ActivityPostList> activityList = [];
  List<ActivityPostList> tempActivityList = [];

  Future<void> activityPostList(BuildContext context, page) async {
    isLoading = true;
    final url = baseUrl + ApiEndPoints().activityPostList;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getInt('isUserId');

    var response =
        await http.get(Uri.parse("$url&user_id=$user_id&page=$page"));
    isLoading = false;

    bool isLiked = true;

    if (response.statusCode == 200) {
      List<ActivityPostListResponse> activityPostListResponse = [];

      activityPostListResponse
          .add(ActivityPostListResponse.fromJson(jsonDecode(response.body)));

      ActivityPostListResponse userResponse = activityPostListResponse[0];
      if (userResponse.status == "true" && userResponse.error_code == "0") {
        if (userResponse.activityPostList != null) {
          var data = userResponse.activityPostList;
          List<ActivityPostList> activityList = [];

          for (var e in data!) {
            activityList.add(e);
          }
          setState(() {
            tempActivityList = activityList;
          });
        }
      }
    } else {
      customDialog(context, message: "Data not found", title: 'Error');
    }
  }

  ////////// Call Activity API On Scroll //////////
  void scrollPagination() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      page = page + 1;
      await activityPostList(context, page);
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
                        children: <Widget>[
                          getAppBarUI(),
                          StickyHeader(
                            header: Container(
                              child: getSearchBarUI(),
                            ),
                            content: Container(
                              child: Column(children: <Widget>[
                                getCategoryUI(),
                                getPopularCourseUI(),
                              ]),
                            ),
                          )
                        ]),
                  )),
                  // ),
                ])));
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
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(parent: null),
              itemCount: isLoading
                  ? tempActivityList.length + 1
                  : tempActivityList.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < tempActivityList.length) {
                  final int count = tempActivityList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController?.forward();
                  final activityList = tempActivityList[index];

                  RegExp exp =
                      RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
                  String content = activityList.content!.replaceAll(exp, '');
                  bool? isLiked = activityList.like_c_user == true;

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
                            child: SizedBox(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                              ),
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                  "${activityList.author_image}",
                                                ),
                                              ),
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
                                                        "${activityList.user_name}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                  "${activityList.date_recorded}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff073278)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: AutoSizeText(
                                                  content,
                                                  textAlign: TextAlign.start,
                                                  minFontSize: 15,
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.1,
                                                    color: Color(0xff073278),
                                                  ),
                                                )),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 150,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 0,
                                            ),
                                            child: Image(
                                              image: NetworkImage(
                                                "${activityList.image_link}",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  if (_isLiked) {
                                                    _isLiked = false;
                                                    await activityLikePostList(
                                                      context,
                                                      _isLiked,
                                                      activityList.id,
                                                    );
                                                  } else {
                                                    _isLiked = true;
                                                    await activityLikePostList(
                                                      context,
                                                      _isLiked,
                                                      activityList.id,
                                                    );
                                                  }
                                                  setState(() {
                                                    activityList.like_c_user =
                                                        activityList
                                                            .like_c_user;
                                                  });
                                                },
                                                icon: activityList
                                                            .like_c_user ==
                                                        true
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )
                                                    : Icon(
                                                        Icons.favorite,
                                                        color:
                                                            Color(0xff073278),
                                                      ),
                                                iconSize: 30.0,
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.comment_outlined,
                                                  size: 30,
                                                ),
                                                onPressed: () => {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Postcomment(
                                                              activityList.id,
                                                              commentType),
                                                    ),
                                                  ),
                                                },
                                                color: Color(0xff073278),
                                              ),
                                              Text(
                                                "${activityList.total_comment}",
                                                style: TextStyle(
                                                  color: Color(0xff073278),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  "${activityList.like_count}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Color(0xff073278),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
              },
            );
          }
        },
      ),
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 18, right: 16),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PopularCourseListView(
                ),
          ],
        ),
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
                          onTap: () {
                            scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          },
                          style: TextStyle(
                            fontFamily: 'Hind',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff073278),
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for activity',
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
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'All Updates',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 1 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 1,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? 1 : null;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'Likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 2 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 2,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? 2 : null;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'Connections',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 3 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 3,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? 3 : null;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'Groups',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 4 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 4,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? 4 : null;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'Mentions',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 5 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 5,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? 5 : null;
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ChoiceChip(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  label: Text(
                    'Following',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: value == 6 ? Colors.white : Color(0xff073278),
                    ),
                  ),
                  selected: value == 6,
                  selectedColor: Color(0xff073278),
                  backgroundColor: Colors.transparent,
                  onSelected: (bool selected) {
                    setState(
                      () {
                        value = selected ? 6 : null;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
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
                  'Activity',
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
          Container(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Addpost("Activity"),
                  ),
                );
              },
              child: const Icon(
                Icons.edit_sharp,
              ),
              backgroundColor: Color(0xFF063278),
            ),
          )
        ],
      ),
    );
  }
}

///////// Like Count API Calling /////////////
activityLikePostList(BuildContext context, _isLiked, id) async {
  final url = baseUrl + ApiEndPoints().activityLikePostList;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getInt('isUserId');
  var content = _isLiked == false ? "Like" : "Unlike";
  Map<String, String> params = {
    'activity_id': id,
    'content': content,
    'user_id': userId.toString(),
  };
  print("vvvvv");
  print(content);
  var response = await http.post(Uri.parse(url), body: params);
  print(response);
  if (response.statusCode == 200) {
    List<ActivityLikePostListResponse> activityLikePostListResponse = [];

    activityLikePostListResponse
        .add(ActivityLikePostListResponse.fromjson(jsonDecode(response.body)));

    ActivityLikePostListResponse activityLikePostListRes =
        activityLikePostListResponse[0];
  }
}
