import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_flutter_ui_templates/course/models/category.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'course_info_screen.dart';
import 'dart:convert';
import 'package:best_flutter_ui_templates/api/api.dart';
import 'package:http/http.dart' as http;

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  final scrollController = ScrollController();
  var isLoading = false;
  int page = 1;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    getCourseList(context, page);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1));
    return true;
  }

  /////////////  Course  API  Calling  /////////////
  List<ListCourse> listCourse = [];
  List<ListCourse> tempListCourse = [];

  Future<void> getCourseList(BuildContext context, page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('isUserId');

    isLoading = true;

    var url = baseUrl +
        ApiEndPoints().courseList +
        "&user_id=$userId&page=$page&cource_type=non-ofc&category_id=326";
    var response = await http.get(Uri.parse(url));

    isLoading = false;

    if (response.statusCode == 200) {
      List<CourseListResponse> courseListResponse = [];
      courseListResponse
          .add(CourseListResponse.fromjson(jsonDecode(response.body)));
      CourseListResponse courseResponse = courseListResponse[0];
      if (courseResponse.status == true && courseResponse.error_code == "0") {
        if (courseResponse.listCourse != null) {
          var data = courseResponse.listCourse;
          List<ListCourse> listCourse = [];
          for (var e in data!) {
            listCourse.add(e);
          }

          setState(() {
            tempListCourse = listCourse;
          });
        }
      }
    }
  }

  ///////////// Call Course API On Scroll /////////////
  void scrollPagination() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      page = page + 1;
      await getCourseList(context, page);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                CategoryView(
                  tempListCourse: tempListCourse,
                  animationController: animationController,
                  scrollController: scrollController,
                  callback: widget.callBack,
                  isLoading: isLoading,
                ),
              ],
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatefulWidget {
  const CategoryView(
      {Key? key,
      this.tempListCourse,
      this.animationController,
      this.animation,
      this.scrollController,
      this.callback,
      this.isLoading})
      : super(key: key);

  final VoidCallback? callback;
  final tempListCourse;
  final ScrollController? scrollController;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final isLoading;

  @override
  _CategoryView createState() => _CategoryView();
}

class _CategoryView extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        controller: widget.scrollController,
        itemCount: widget.isLoading
            ? widget.tempListCourse.length + 1
            : widget.tempListCourse.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          if (index < widget.tempListCourse.length) {
            final int count = widget.tempListCourse.length;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn),
              ),
            );

            // ListGetGroup getGroup = tempGroupCourse[index];

            widget.animationController?.forward();
            final ListCourse = widget.tempListCourse[index];

            return AnimatedBuilder(
              animation: widget.animationController!,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: animation,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0.0, 50 * (1.0 - animation.value), 0.0),
                    child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: widget.callback,
                        child: GestureDetector(
                          onTap: () async {
                            await singleCourseDetail(context, ListCourse!.id);
                          },
                          child: SizedBox(
                            height: 280,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: HexColor('#F8FAFB'),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16.0)),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    //set border radius more than 50% of height and width to make circle
                                                  ),
                                                  child: Container(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8,
                                                                  left: 16,
                                                                  right: 16),
                                                          child: AutoSizeText(
                                                            "${ListCourse!.post_title}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              letterSpacing:
                                                                  0.27,
                                                              color: Color(
                                                                  0xff073278),
                                                            ),
                                                            minFontSize: 10,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 16,
                                                            right: 16,
                                                          ),
                                                          child: AutoSizeText(
                                                            "${ListCourse!.post_author_name}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              letterSpacing:
                                                                  0.27,
                                                              color: Color(
                                                                  0xff073278),
                                                            ),
                                                            minFontSize: 8,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 48,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 48,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, right: 16, left: 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Color(0xff073278)
                                                  .withOpacity(0.2),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 6.0),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0)),
                                        child: AspectRatio(
                                          aspectRatio: 1.28,
                                          child: Image(
                                            image: NetworkImage(
                                              "${ListCourse!.post_thumbnail_link}",
                                            ),
                                            width: 300,
                                            height: 180,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
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
}
