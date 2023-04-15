// ignore_for_file: non_constant_identifier_names
// import 'dart:convert';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:best_flutter_ui_templates/api/api.dart';
// import 'package:best_flutter_ui_templates/groups/course_info_screen.dart';
// import 'package:best_flutter_ui_templates/main.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class PopularCourseListView extends StatefulWidget {
//   const PopularCourseListView({Key? key, this.callBack}) : super(key: key);

//   final Function()? callBack;
//   @override
//   _PopularCourseListViewState createState() => _PopularCourseListViewState();
// }

// class _PopularCourseListViewState extends State<PopularCourseListView>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   final scrollController = ScrollController();
//   var isLoading = false;
//   int page = 1;

//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     super.initState();
//     scrollController.addListener(scrollPagination);
//     getGroupList(
//       context,
//       page,
//     );
//   }

//   Future<bool> getData() async {
//     await Future<dynamic>.delayed(const Duration(milliseconds: 200));
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Padding(
//     //   padding: const EdgeInsets.only(top: 8),
//     //   child: FutureBuilder<bool>(
//     //     future: getData(),
//     //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//     //       if (!snapshot.hasData) {
//     //         return const SizedBox();
//     //       } else {
//     //         return GridView(
//     //           physics: NeverScrollableScrollPhysics(),
//     //           children: [
//     //             CategoryView(
//     //               tempGroupCourse: tempGroupCourse,
//     //               animationController: animationController,
//     //               scrollController: scrollController,
//     //               callback: widget.callBack,
//     //               isLoading: isLoading,
//     //             ),
//     //           ],
//     //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //             crossAxisCount: 1,
//     //             mainAxisSpacing: 32.0,
//     //             crossAxisSpacing: 32.0,
//     //             childAspectRatio: 0.8,
//     //           ),
//     //         );
//     //       }
//     //     },
//     //   ),
//     // );
//   }

//   List<ListGetGroup> groupCourse = [];
//   List<ListGetGroup> tempGroupCourse = [];

//   Future<void> getGroupList(BuildContext context, Page) async {
//     List<GroupListResponse>? groupListResponse;

//     isLoading = true;
//     final url = baseUrl + ApiEndPoints().getGroupList;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var user_id = prefs.getInt('isUserId');
//     var response =
//         await http.get(Uri.parse("$url&user_id=$user_id&page=$Page"));
//     isLoading = false;
//     print(response);
//     if (response.statusCode == 200) {
//       List<GroupListResponse> groupListResponse = [];
//       List<ListGetGroup> listGetGroup = [];

//       groupListResponse
//           .add(GroupListResponse.fromjson(jsonDecode(response.body)));
//       GroupListResponse groupRes = groupListResponse[0];

//       if (groupRes.status == "true" && groupRes.error_code == "0") {
//         if (groupRes.listGetGroup != null) {
//           var data = groupRes.listGetGroup;
//           for (var e in data!) {
//             groupCourse.add(e);
//           }
//           setState(() {
//             tempGroupCourse = groupCourse;
//           });
//         }
//       } else {}
//     }
//   }

//   void scrollPagination() async {
//     if (isLoading) return;
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       setState(() {
//         isLoading = true;
//       });
//       page = page + 1;
//       await getGroupList(
//         context,
//         page,
//       );
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// }

// class CategoryView extends StatefulWidget {
//   const CategoryView(
//       {Key? key,
//       this.tempGroupCourse,
//       this.animationController,
//       this.animation,
//       this.scrollController,
//       this.isLoading,
//       this.callback})
//       : super(key: key);

//   final VoidCallback? callback;
//   final tempGroupCourse;
//   final AnimationController? animationController;
//   final Animation<double>? animation;
//   final ScrollController? scrollController;
//   final isLoading;

//   @override
//   _CategoryView createState() => _CategoryView();
// }

// class _CategoryView extends State<CategoryView> {
//   @override
//   Widget build(BuildContext context) {
    // return GridView.builder(
    //     physics: const AlwaysScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     controller: widget.scrollController,
    //     itemCount: widget.isLoading
    //         ? widget.tempGroupCourse.length + 1
    //         : widget.tempGroupCourse.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 32.0,
    //       mainAxisSpacing: 32.0,
    //       childAspectRatio: 0.8,
    //     ),
    //     itemBuilder: (context, index) {
    //       if (index < widget.tempGroupCourse.length) {
    //         final int count = widget.tempGroupCourse.length;
    //         final Animation<double> animation =
    //             Tween<double>(begin: 0.0, end: 1.0).animate(
    //           CurvedAnimation(
    //             parent: widget.animationController!,
    //             curve: Interval((1 / count) * index, 1.0,
    //                 curve: Curves.fastOutSlowIn),
    //           ),
    //         );

    //         // ListGetGroup getGroup = tempGroupCourse[index];

    //         widget.animationController?.forward();
    //         final ListGetGroup = widget.tempGroupCourse[index];

    //         return AnimatedBuilder(
    //           animation: widget.animationController!,
    //           builder: (BuildContext context, Widget? child) {
    //             return FadeTransition(
    //                 opacity: animation,
    //                 child: Transform(
    //                   transform: Matrix4.translationValues(
    //                       0.0, 50 * (1.0 - animation.value), 0.0),
    //                   child: InkWell(
    //                     splashColor: Colors.transparent,
    //                     onTap: widget.callback,
    //                     child: GestureDetector(
    //                       onTap: () async {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) =>
    //                                 CourseInfoScreen(ListGetGroup.Id),
    //                           ),
    //                         );
    //                       },
    //                       child: SizedBox(
    //                           height: 280,
    //                           child: Stack(
    //                               alignment: AlignmentDirectional.bottomCenter,
    //                               children: <Widget>[
    //                                 Container(
    //                                   child: Column(
    //                                     children: <Widget>[
    //                                       Expanded(
    //                                         child: Container(
    //                                           decoration: BoxDecoration(
    //                                             color: HexColor('#F8FAFB'),
    //                                             borderRadius:
    //                                                 const BorderRadius.all(
    //                                                     Radius.circular(16.0)),
    //                                           ),
    //                                           child: Column(
    //                                             children: <Widget>[
    //                                               Expanded(
    //                                                 child: Container(
    //                                                   child: Column(
    //                                                     children: <Widget>[
    //                                                       Padding(
    //                                                         padding:
    //                                                             const EdgeInsets
    //                                                                     .only(
    //                                                                 top: 8,
    //                                                                 left: 16,
    //                                                                 right: 16),
    //                                                         child: AutoSizeText(
    //                                                           "${ListGetGroup!.Title}",
    //                                                           textAlign:
    //                                                               TextAlign
    //                                                                   .left,
    //                                                           style: TextStyle(
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .w600,
    //                                                             // fontSize: 16,
    //                                                             letterSpacing:
    //                                                                 0.27,
    //                                                             color: Color(
    //                                                                 0xff073278),
    //                                                           ),
    //                                                           minFontSize: 16,
    //                                                           maxLines: 2,
    //                                                           overflow:
    //                                                               TextOverflow
    //                                                                   .ellipsis,
    //                                                         ),
    //                                                       ),
    //                                                       Padding(
    //                                                         padding:
    //                                                             const EdgeInsets
    //                                                                 .only(
    //                                                           left: 16,
    //                                                           right: 16,
    //                                                         ),
    //                                                         child: Row(
    //                                                           mainAxisAlignment:
    //                                                               MainAxisAlignment
    //                                                                   .spaceBetween,
    //                                                           crossAxisAlignment:
    //                                                               CrossAxisAlignment
    //                                                                   .center,
    //                                                           children: <
    //                                                               Widget>[
    //                                                             Text(
    //                                                               " ${ListGetGroup!.Status}",
    //                                                               textAlign:
    //                                                                   TextAlign
    //                                                                       .left,
    //                                                               style:
    //                                                                   TextStyle(
    //                                                                 fontWeight:
    //                                                                     FontWeight
    //                                                                         .w200,
    //                                                                 fontSize:
    //                                                                     12,
    //                                                                 letterSpacing:
    //                                                                     0.27,
    //                                                                 color: Color(
    //                                                                     0xff073278),
    //                                                               ),
    //                                                             ),
    //                                                             AutoSizeText(
    //                                                               " ${ListGetGroup!.Time}",
    //                                                               textAlign:
    //                                                                   TextAlign
    //                                                                       .left,
    //                                                               style:
    //                                                                   TextStyle(
    //                                                                 fontWeight:
    //                                                                     FontWeight
    //                                                                         .w200,
    //                                                                 fontSize:
    //                                                                     10,
    //                                                                 letterSpacing:
    //                                                                     0.27,
    //                                                                 color: Color(
    //                                                                     0xff073278),
    //                                                               ),
    //                                                               minFontSize:
    //                                                                   8,
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const SizedBox(
    //                                                 width: 48,
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       const SizedBox(
    //                                         height: 48,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Container(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         top: 24, right: 16, left: 16),
    //                                     child: Container(
    //                                       decoration: BoxDecoration(
    //                                         borderRadius:
    //                                             const BorderRadius.all(
    //                                                 Radius.circular(16.0)),
    //                                         boxShadow: <BoxShadow>[
    //                                           BoxShadow(
    //                                               color: Color(0xff073278)
    //                                                   .withOpacity(0.2),
    //                                               offset:
    //                                                   const Offset(0.0, 0.0),
    //                                               blurRadius: 6.0),
    //                                         ],
    //                                       ),
    //                                       child: ClipRRect(
    //                                         borderRadius:
    //                                             const BorderRadius.all(
    //                                                 Radius.circular(16.0)),
    //                                         child: AspectRatio(
    //                                           aspectRatio: 1.28,
    //                                           child: Image(
    //                                             image: NetworkImage(
    //                                               'https://readyforyourreview.com/SeanDouglas12/wp-content/uploads/2021/08/OFC-Learn-Gradient-Filled-Horizontal-1536x842.png',
    //                                             ),
    //                                             width: 300,
    //                                             height: 180,
    //                                             fit: BoxFit.fill,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ])),
    //                     ),
    //                   ),
    //                 ));
    //             // );
    //           },
    //         );
    //       } else {
    //         return Padding(
    //           padding: EdgeInsets.only(bottom: 50),
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     });
//   }
// }

// class GroupListResponse {
//   String? status;
//   String? error_code;
//   String? message;
//   List<ListGetGroup>? listGetGroup;

//   GroupListResponse({
//     this.status,
//     this.error_code,
//     this.listGetGroup,
//     this.message,
//   });

//   GroupListResponse.fromjson(Map<String, dynamic> json) {
//     listGetGroup = <ListGetGroup>[];
//     status = json['status'];
//     error_code = json['error_code'];
//     message = json['message'];

//     listGetGroup =
//         (json['data'] as List).map((e) => ListGetGroup.fromjson(e)).toList();
//   }
// }

// class ListGetGroup {
//   String? Id;
//   String? Type;
//   String? Title;
//   String? Status;
//   String? Time;
//   String? Image_link;

//   ListGetGroup({
//     this.Id,
//     this.Type,
//     this.Title,
//     this.Status,
//     this.Time,
//     this.Image_link,
//   });

//   ListGetGroup.fromjson(Map<String, dynamic> json) {
//     Id = json['id'];
//     Type = json['type'];
//     Title = json['Title'];
//     Status = json['Status'];
//     Time = json['Time'];
//     Image_link = json['Image_link'];
//   }
// }
