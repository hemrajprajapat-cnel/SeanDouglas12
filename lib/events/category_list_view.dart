import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_flutter_ui_templates/events/course_info_screen.dart';
import 'package:best_flutter_ui_templates/events/models/category.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:best_flutter_ui_templates/api/api.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool isLoading = false;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    getPreviusEventList(context);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  /////////// Previous Event List API /////////////
  List<PreviousEventListData> previousEventListData = [];
  List<PreviousEventListData> tempPreviousEventListData = [];

  Future<void> getPreviusEventList(
    BuildContext context,
  ) async {
    setState(() {
      isLoading = true;
    });

    var url = baseUrl + ApiEndPoints().previousEventList;
    var response = await http.get(Uri.parse(url));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      List<PreviousEventListResponse> previousEventListResponse = [];
      previousEventListResponse
          .add(PreviousEventListResponse.fromjson(jsonDecode(response.body)));
      PreviousEventListResponse eventPreResponse = previousEventListResponse[0];
      if (eventPreResponse.status == true &&
          eventPreResponse.error_code == "0") {
        if (eventPreResponse.previousEventListData != null) {
          var data = eventPreResponse.previousEventListData;
          List<PreviousEventListData> previousEventListData = [];
          for (var e in data!) {
            previousEventListData.add(e);
          }

          setState(() {
            tempPreviousEventListData = previousEventListData;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: isLoading
    //       ? CircularProgressIndicator()
    return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Container(
          height: 134,
          width: double.infinity,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : FutureBuilder<bool>(
                    future: getData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        return ListView.builder(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 0, right: 16, left: 16),
                          itemCount: tempPreviousEventListData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final int count = tempPreviousEventListData.length;
                            final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: animationController!,
                                        curve: Interval(
                                            (1 / count) * index, 1.0,
                                            curve: Curves.fastOutSlowIn)));
                            animationController?.forward();
                            return CategoryView(
                              animation: animation,
                              previuoslist: tempPreviousEventListData[index],
                              animationController: animationController,
                              callback: widget.callBack,
                            );
                          },
                        );
                      }
                    },
                  ),
          ),
        ));
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      // this.category,
      this.previuoslist,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  // final Category? category;
  final previuoslist;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: GestureDetector(
                onTap: () async {
                  await getEventDetails(context, previuoslist!.id);
                },
                child: SizedBox(
                  width: 280,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 48,
                            ),
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                shadowColor: Colors.white,
                                color: Colors.white,
                                elevation: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // color: HexColor('#F8FAFB'),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 48 + 24.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // color: HexColor('#F8FAFB'),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                  previuoslist!.event_name,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    letterSpacing: 0.27,
                                                    color: Color(0xff073278),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  AutoSizeText(
                                                    previuoslist!
                                                        .event_start_date,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color: Color(0xff073278),
                                                    ),
                                                    minFontSize: 8,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16, right: 16),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff66C23D),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    8.0)),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        child: Text(
                                                          'Click to view - Recording',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10,
                                                            letterSpacing: 0.27,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 24, left: 16),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Image(
                                      image: NetworkImage(
                                        "${previuoslist!.event_thumbnail_image_link}",
                                      ),
                                      width: 300,
                                      height: 180,
                                      fit: BoxFit.fill,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
