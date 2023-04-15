// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names
// import 'dart:convert';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:best_flutter_ui_templates/activity/comment.dart';
// import 'package:best_flutter_ui_templates/activity/models/category.dart';
// import 'package:best_flutter_ui_templates/api/api.dart';
// import 'package:best_flutter_ui_templates/comman/custome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class PopularCourseListView extends StatefulWidget {
//   PopularCourseListView({Key? key, this.callBack}) : super(key: key);

//   final Function()? callBack;
//   @override
//   _PopularCourseListView createState() => _PopularCourseListView();
// }

// class _PopularCourseListView extends State<PopularCourseListView>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   final scrollController = ScrollController();
  // var isLoading = false;
  // int page = 1;
  // var commentType = "A";
  // @override
  // void initState() {
  //   animationController = AnimationController(
  //       duration: const Duration(milliseconds: 2000), vsync: this);
  //   super.initState();
  //   scrollController.addListener(scrollPagination);
  //   activityPostList(context, page);
  // }

  // Future<bool> getData() async {
  //   await Future<dynamic>.delayed(const Duration(milliseconds: 1));
  //   return true;
  // }

  // ///////////// Activity API Calling /////////////
  // List<ActivityPostList> activityList = [];
  // List<ActivityPostList> tempActivityList = [];

  // Future<void> activityPostList(BuildContext context, page) async {
  //   isLoading = true;
  //   final url = baseUrl + ApiEndPoints().activityPostList;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var user_id = prefs.getInt('isUserId');

  //   var response =
  //       await http.get(Uri.parse("$url&user_id=$user_id&page=$page"));
  //   isLoading = false;

  //   if (response.statusCode == 200) {
  //     List<ActivityPostListResponse> activityPostListResponse = [];

  //     activityPostListResponse
  //         .add(ActivityPostListResponse.fromJson(jsonDecode(response.body)));

  //     ActivityPostListResponse userResponse = activityPostListResponse[0];
  //     if (userResponse.status == "true" && userResponse.error_code == "0") {
  //       if (userResponse.activityPostList != null) {
  //         var data = userResponse.activityPostList;
  //         List<ActivityPostList> activityList = [];

  //         for (var e in data!) {
  //           activityList.add(e);
  //         }
  //         setState(() {
  //           tempActivityList = activityList;
  //         });
  //       }
  //     }
  //   } else {
  //     customDialog(context, message: "Data not found", title: 'Error');
  //   }
  // }

  // ///////////// Call Activity API On Scroll ////////////
  // void scrollPagination() async {
  //   if (isLoading) return;
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     page = page + 1;
  //     await activityPostList(context, page);
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.only(top: 8),
    //   child: FutureBuilder<bool>(
    //     future: getData(),
    //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //       if (!snapshot.hasData) {
    //         return const SizedBox();
    //       } else {
    //         return ListView.builder(
    //           shrinkWrap: true,
    //           // controller: scrollController,
    //           itemCount: isLoading
    //               ? tempActivityList.length + 1
    //               : tempActivityList.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             if (index < tempActivityList.length) {
    //               final int count = tempActivityList.length;
    //               final Animation<double> animation =
    //                   Tween<double>(begin: 0.0, end: 1.0).animate(
    //                 CurvedAnimation(
    //                   parent: animationController!,
    //                   curve: Interval((1 / count) * index, 1.0,
    //                       curve: Curves.fastOutSlowIn),
    //                 ),
    //               );
    //               animationController?.forward();
    //               final activityList = tempActivityList[index];

    //               RegExp exp = RegExp(r"<[^>]*>",
    //                   multiLine: true, caseSensitive: true);
    //               String content = activityList.content!.replaceAll(exp, '');

    //               // var like_count = activityList.like_count.split("you");

    //               // print(like_count.toString());

    //               // var like_count = activityList.like_count;
    //               // var splitted = like_count.split(',');
    //               // print("splitted");
    //               // print(splitted.toString());

    //               return AnimatedBuilder(
    //                 animation: animationController!,
    //                 builder: (BuildContext context, Widget? child) {
    //                   return FadeTransition(
    //                     opacity: animation,
    //                     child: Transform(
    //                       transform: Matrix4.translationValues(
    //                           0.0, 50 * (0.5 - animation.value), 0.0),
    //                       child: InkWell(
    //                         splashColor: Colors.transparent,
    //                         child: SizedBox(
    //                           child: Stack(
    //                             alignment: AlignmentDirectional.bottomCenter,
    //                             children: <Widget>[
    //                               Container(
    //                                 child: Card(
    //                                   elevation: 5,
    //                                   shape: RoundedRectangleBorder(
    //                                     borderRadius:
    //                                         BorderRadius.circular(5),
    //                                   ),
    //                                   child: Column(
    //                                     children: [
    //                                       Padding(
    //                                         padding: EdgeInsets.all(10),
    //                                       ),
    //                                       Row(
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment
    //                                                 .spaceBetween,
    //                                         children: [
    //                                           Padding(
    //                                             padding:
    //                                                 const EdgeInsets.all(5),
    //                                           ),
    //                                           CircleAvatar(
    //                                             radius: 20,
    //                                             backgroundImage: AssetImage(
    //                                               'assets/images/userImage.png',
    //                                             ),
    //                                           ),
    //                                           Expanded(
    //                                             child: Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(
    //                                                 left: 8,
    //                                               ),
    //                                               child: Column(
    //                                                 mainAxisSize:
    //                                                     MainAxisSize.min,
    //                                                 crossAxisAlignment:
    //                                                     CrossAxisAlignment
    //                                                         .start,
    //                                                 children: <Widget>[
    //                                                   Text(
    //                                                     "${activityList.user_name}",
    //                                                     style: const TextStyle(
    //                                                         fontWeight:
    //                                                             FontWeight
    //                                                                 .bold,
    //                                                         color: Color(
    //                                                             0xff073278)),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                           Padding(
    //                                             padding: EdgeInsets.all(8),
    //                                             child: Text(
    //                                               "${activityList.date_recorded}",
    //                                               style: TextStyle(
    //                                                   fontWeight:
    //                                                       FontWeight.w600,
    //                                                   color:
    //                                                       Color(0xff073278)),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                       Padding(
    //                                         padding: EdgeInsets.only(
    //                                           top: 10,
    //                                           left: 10,
    //                                           right: 10,
    //                                         ),
    //                                         child: Align(
    //                                             alignment: Alignment.topLeft,
    //                                             child: AutoSizeText(
    //                                               content,
    //                                               textAlign: TextAlign.start,
    //                                               minFontSize: 15,
    //                                               maxLines: 5,
    //                                               overflow:
    //                                                   TextOverflow.ellipsis,
    //                                               style: TextStyle(
    //                                                 fontWeight:
    //                                                     FontWeight.w500,
    //                                                 height: 1.1,
    //                                                 color: Color(0xff073278),
    //                                               ),
    //                                             )),
    //                                       ),
    //                                       Container(
    //                                         width: double.infinity,
    //                                         height: 150,
    //                                         padding: EdgeInsets.symmetric(
    //                                           horizontal: 12,
    //                                           vertical: 0,
    //                                         ),
    //                                         child: Image(
    //                                           image: NetworkImage(
    //                                             "${activityList.image_link}",
    //                                           ),
    //                                           fit: BoxFit.fill,
    //                                         ),
    //                                       ),
    //                                       Row(
    //                                         children: [
    //                                           LikeButton(
    //                                               onTap: (isLiked) {
    //                                                 return activityLikePostList(
    //                                                   context,
    //                                                   isLiked,
    //                                                   activityList.id,
    //                                                 );
    //                                               },
    //                                               padding: EdgeInsets.only(
    //                                                   left: 15),
    //                                               likeBuilder: (isLiked) {
    //                                                 return Icon(
    //                                                   Icons.favorite,
    //                                                   color: activityList
    //                                                               .like_c_user ==
    //                                                           true
    //                                                       ? Colors.red
    //                                                       : Color(0xff073278),
    //                                                   size: 30,
    //                                                 );
    //                                               }),
    //                                           IconButton(
    //                                             icon: const Icon(
    //                                               Icons.comment_outlined,
    //                                               size: 30,
    //                                             ),
    //                                             onPressed: () => {
    //                                               Navigator.push(
    //                                                 context,
    //                                                 MaterialPageRoute(
    //                                                   builder: (context) =>
    //                                                       Postcomment(
    //                                                           activityList.id,
    //                                                           commentType),
    //                                                 ),
    //                                               ),
    //                                             },
    //                                             color: Color(0xff073278),
    //                                           ),
    //                                           Text(
    //                                             "${activityList.total_comment}",
    //                                             style: TextStyle(
    //                                               color: Color(0xff073278),
    //                                             ),
    //                                           )
    //                                         ],
    //                                       ),
    //                                       Row(
    //                                         children: [
    //                                           Padding(
    //                                             padding:
    //                                                 EdgeInsets.only(left: 15),
    //                                             child: Text(
    //                                               "${activityList.like_count}",
    //                                               style: TextStyle(
    //                                                 fontWeight:
    //                                                     FontWeight.w500,
    //                                                 fontSize: 12,
    //                                                 color: Color(0xff073278),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                       SizedBox(
    //                                         height: 20,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               );
    //             } else {
    //               return Padding(
    //                 padding: EdgeInsets.only(bottom: 50),
    //                 child: Center(
    //                   child: CircularProgressIndicator(),
    //                 ),
    //               );
    //             }
    //           },
    //         );

    //         // return GridView(
    //         //   physics: NeverScrollableScrollPhysics(),
    //         //   children: [

    //         //     CategoryView(
    //         //       tempActivityList: tempActivityList,
    //         //       animationController: animationController,
    //         //       scrollController: scrollController,
    //         //       isLoading: isLoading,
    //         //       commentType: commentType,
    //         //     ),
    //         //   ],
    //         //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         //     crossAxisCount: 1,
    //         //     mainAxisSpacing: 32.0,
    //         //     crossAxisSpacing: 32.0,
    //         //     childAspectRatio: 0.8,
    //         //   ),
    //         // );
    //       }
    //     },
    //   ),
    // );
  // }
// }

// class CategoryView extends StatefulWidget {
//   const CategoryView({
//     Key? key,
//     this.tempActivityList,
//     this.animationController,
//     this.scrollController,
//     this.isLoading,
//     this.commentType,
//   }) : super(key: key);

//   final tempActivityList;
//   final AnimationController? animationController;
//   final ScrollController? scrollController;
//   final isLoading;
//   final commentType;

//   @override
//   _CategoryView createState() => _CategoryView();
// }

// class _CategoryView extends State<CategoryView> {
//   var commentType = "A";

//   @override
//   Widget build(BuildContext context) {
// return ListView.builder(
//   controller: widget.scrollController,
//   itemCount: widget.isLoading
//       ? widget.tempActivityList.length + 1
//       : widget.tempActivityList.length,
//   itemBuilder: (BuildContext context, int index) {
//     if (index < widget.tempActivityList.length) {
//       final int count = widget.tempActivityList.length;
//       final Animation<double> animation =
//           Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(
//           parent: widget.animationController!,
//           curve: Interval((1 / count) * index, 1.0,
//               curve: Curves.fastOutSlowIn),
//         ),
//       );
//       widget.animationController?.forward();
//       final activityList = widget.tempActivityList[index];

//       RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
//       String content = activityList.content!.replaceAll(exp, '');

//       // var like_count = activityList.like_count.split("you");

//       // print(like_count.toString());

//       // var like_count = activityList.like_count;
//       // var splitted = like_count.split(',');
//       // print("splitted");
//       // print(splitted.toString());

//       return AnimatedBuilder(
//         animation: widget.animationController!,
//         builder: (BuildContext context, Widget? child) {
//           return FadeTransition(
//             opacity: animation,
//             child: Transform(
//               transform: Matrix4.translationValues(
//                   0.0, 50 * (0.5 - animation.value), 0.0),
//               child: InkWell(
//                 splashColor: Colors.transparent,
//                 child: SizedBox(
//                   child: Stack(
//                     alignment: AlignmentDirectional.bottomCenter,
//                     children: <Widget>[
//                       Container(
//                         child: Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(10),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(5),
//                                   ),
//                                   CircleAvatar(
//                                     radius: 20,
//                                     backgroundImage: AssetImage(
//                                       'assets/images/userImage.png',
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                         left: 8,
//                                       ),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Text(
//                                             "${activityList.user_name}",
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xff073278)),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(8),
//                                     child: Text(
//                                       "${activityList.date_recorded}",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           color: Color(0xff073278)),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 10,
//                                   left: 10,
//                                   right: 10,
//                                 ),
//                                 child: Align(
//                                     alignment: Alignment.topLeft,
//                                     child: AutoSizeText(
//                                       content,
//                                       textAlign: TextAlign.start,
//                                       minFontSize: 15,
//                                       maxLines: 5,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         height: 1.1,
//                                         color: Color(0xff073278),
//                                       ),
//                                     )),
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 height: 150,
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 0,
//                                 ),
//                                 child: Image(
//                                   image: NetworkImage(
//                                     "${activityList.image_link}",
//                                   ),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   LikeButton(
//                                       onTap: (isLiked) {
//                                         return activityLikePostList(
//                                           context,
//                                           isLiked,
//                                           activityList.id,
//                                         );
//                                       },
//                                       padding: EdgeInsets.only(left: 15),
//                                       likeBuilder: (isLiked) {
//                                         return Icon(
//                                           Icons.favorite,
//                                           color: activityList.like_c_user ==
//                                                   true
//                                               ? Colors.red
//                                               : Color(0xff073278),
//                                           size: 30,
//                                         );
//                                       }),
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.comment_outlined,
//                                       size: 30,
//                                     ),
//                                     onPressed: () => {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => Postcomment(
//                                               activityList.id, commentType),
//                                         ),
//                                       ),
//                                     },
//                                     color: Color(0xff073278),
//                                   ),
//                                   Text(
//                                     "${activityList.total_comment}",
//                                     style: TextStyle(
//                                       color: Color(0xff073278),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(left: 15),
//                                     child: Text(
//                                       "${activityList.like_count}",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12,
//                                         color: Color(0xff073278),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Padding(
//         padding: EdgeInsets.only(bottom: 50),
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//   },
// );
// }
// }

/////////// Like Count API Calling /////////////
// Future<bool> activityLikePostList(BuildContext context, isLiked, id) async {
//   final url = baseUrl + ApiEndPoints().activityLikePostList;

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var userId = prefs.getInt('isUserId');

//   Map<String, String> params = {
//     'activity_id': id,
//     'content': isLiked == false ? "Like" : "Unlike",
//     'user_id': userId.toString(),
//   };

//   var response = await http.post(Uri.parse(url), body: params);

//   if (response.statusCode == 200) {
//     List<ActivityLikePostListResponse> activityLikePostListResponse = [];

//     activityLikePostListResponse
//         .add(ActivityLikePostListResponse.fromjson(jsonDecode(response.body)));

//     ActivityLikePostListResponse activityLikePostListRes =
//         activityLikePostListResponse[0];

//     return activityLikePostListRes.content == "Like" ? true : false;
//   }
//   return false;
// }
