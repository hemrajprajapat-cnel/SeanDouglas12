// ignore_for_file: unused_local_variable, non_constant_identifier_names
// import 'dart:convert';
// import 'package:best_flutter_ui_templates/activity/comment.dart';
// import 'package:best_flutter_ui_templates/activity/home_design_course.dart';
// import 'package:best_flutter_ui_templates/activity/popular_course_list_view.dart';
// import 'package:best_flutter_ui_templates/api/api.dart';
// import 'package:best_flutter_ui_templates/comman/custome_dialog.dart';
// import 'package:best_flutter_ui_templates/library/models/category.dart';
// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:auto_size_text/auto_size_text.dart';

// class PopularCourseListView extends StatefulWidget {
//   const PopularCourseListView({Key? key, this.callBack}) : super(key: key);

//   final Function()? callBack;
//   @override
//   _PopularCourseListView createState() => _PopularCourseListView();
// }

// class _PopularCourseListView extends State<PopularCourseListView>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   final scrollController = ScrollController();
//   var isLoading = false;
//   int page = 1;
//   var commentType = "L";
//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     super.initState();
//     scrollController.addListener(scrollPagination);
//     libraryGetList(context, page);
//   }

//   Future<bool> getData() async {
//     await Future<dynamic>.delayed(const Duration(milliseconds: 200));
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8),
//       child: FutureBuilder<bool>(
//         future: getData(),
//         builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//           if (!snapshot.hasData) {
//             return const SizedBox();
//           } else {
//             return Container(
//               height: double.maxFinite,
//               child: GridView(
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   CategoryView(
//                     tempLibraryList: tempLibraryList,
//                     animationController: animationController,
//                     scrollController: scrollController,
//                     isLoading: isLoading,
//                     commentType: commentType,
//                   ),
//                 ],
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   mainAxisSpacing: 32.0,
//                   crossAxisSpacing: 32.0,
//                   childAspectRatio: 0.8,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   List<LibraryGetList> libraryList = [];
//   List<LibraryGetList> tempLibraryList = [];

//   Future<void> libraryGetList(
//     BuildContext context,
//     page,
//   ) async {
//     List<LibraryGetListResponse>? libraryGetListResponse;
//     isLoading = true;
//     final url = baseUrl + ApiEndPoints().libraryGetList;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var user_id = prefs.getInt('isUserId');
//     var response =
//         await http.get(Uri.parse("$url&user_id=$user_id&page=$page"));
//     isLoading = false;

//     if (response.statusCode == 200) {
//       List<LibraryGetListResponse> libraryGetListResponse = [];
//       List<LibraryGetList> libraryGetList = [];
//       libraryGetListResponse
//           .add(LibraryGetListResponse.fromJson(jsonDecode(response.body)));
//       LibraryGetListResponse userResponse = libraryGetListResponse[0];

//       if (userResponse.status == "true" && userResponse.error_code == "0") {
//         if (userResponse.libraryGetList != null) {
//           var data = userResponse.libraryGetList;
//           for (var e in data!) {
//             libraryList.add(e);
//           }
//           setState(() {
//             tempLibraryList = libraryList;
//           });
//         }
//       }
//     } else {
//       customDialog(context, message: "Data not found", title: 'Error');
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
//       libraryGetList(context, page);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// }

// class CategoryView extends StatefulWidget {
//   const CategoryView(
//       {Key? key,
//       this.tempLibraryList,
//       this.animationController,
//       this.scrollController,
//       this.isLoading,
//       this.commentType})
//       : super(key: key);

//   final tempLibraryList;
//   final AnimationController? animationController;
//   final ScrollController? scrollController;
//   final isLoading;
//   final commentType;

//   @override
//   _CategoryView createState() => _CategoryView();
// }

// class _CategoryView extends State<CategoryView> {
//   var commentType = "L";

//   @override
//   Widget build(BuildContext context) {
    // return ListView.builder(
    //     controller: widget.scrollController,
    //     itemCount: widget.isLoading
    //         ? widget.tempLibraryList.length + 1
    //         : widget.tempLibraryList.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       if (index < widget.tempLibraryList.length) {
    //         final int count = Category.popularCourseList.length;
    //         final Animation<double> animation =
    //             Tween<double>(begin: 0.0, end: 1.0).animate(
    //           CurvedAnimation(
    //             parent: widget.animationController!,
    //             curve: Interval((1 / count) * index, 1.0,
    //                 curve: Curves.fastOutSlowIn),
    //           ),
    //         );
    //         widget.animationController?.forward();

    //         LibraryGetList librarylist = widget.tempLibraryList[index];

    //         RegExp exp =
    //             RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    //         String content = librarylist.content!.replaceAll(exp, '');

    //         return AnimatedBuilder(
    //           animation: widget.animationController!,
    //           builder: (BuildContext context, Widget? child) {
    //             return FadeTransition(
    //               opacity: animation,
    //               child: Transform(
    //                 transform: Matrix4.translationValues(
    //                     0.0, 50 * (0.5 - animation.value), 0.0),
    //                 child: InkWell(
    //                   splashColor: Colors.transparent,
    //                   // onTap: callback,
    //                   child: SizedBox(
    //                     // height: 250,
    //                     child: Stack(
    //                       alignment: AlignmentDirectional.bottomCenter,
    //                       children: <Widget>[
    //                         Container(
    //                             child: Card(
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
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Padding(
    //                                       padding: const EdgeInsets.all(5),
    //                                     ),
    //                                     CircleAvatar(
    //                                       radius: 20,
    //                                       backgroundImage: AssetImage(
    //                                           'assets/images/userImage.png'),
    //                                     ),
    //                                     Expanded(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(
    //                                           left: 8,
    //                                         ),
    //                                         child: Column(
    //                                           mainAxisSize: MainAxisSize.min,
    //                                           crossAxisAlignment:
    //                                               CrossAxisAlignment.start,
    //                                           children: <Widget>[
    //                                             Text(
    //                                               "Sean Demo",
    //                                               // category!.title,
    //                                               style: const TextStyle(
    //                                                   fontWeight:
    //                                                       FontWeight.bold,
    //                                                   color: Color(0xff073278)),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     Padding(
    //                                       padding: EdgeInsets.all(8),
    //                                       child: Text(
    //                                         "25/02/2022",
    //                                         style: TextStyle(
    //                                             fontWeight: FontWeight.w600,
    //                                             color: Color(0xff073278)),
    //                                       ),
    //                                     ),
    //                                   ]),
    //                               Padding(
    //                                 padding: EdgeInsets.only(
    //                                     top: 10, left: 10, right: 10),
    //                                 child: AutoSizeText(
    //                                   content,
    //                                   textAlign: TextAlign.left,
    //                                   minFontSize: 15,
    //                                   maxLines: 5,
    //                                   overflow: TextOverflow.ellipsis,
    //                                   style: TextStyle(
    //                                     fontWeight: FontWeight.w500,
    //                                     height: 1.2,
    //                                     color: Color(0xff073278),
    //                                   ),
    //                                 ),
    //                               ),
    //                               Stack(
    //                                 children: [
    //                                   Container(
    //                                     padding: EdgeInsets.all(12),
    //                                     child: Image(
    //                                       image: NetworkImage(
    //                                         'https://readyforyourreview.com/SeanDouglas12/wp-content/uploads/2021/08/OFC-Learn-Gradient-Filled-Horizontal-1536x842.png',
    //                                       ),
    //                                       width: 300,
    //                                       height: 180,
    //                                       fit: BoxFit.fill,
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               Row(children: [
    //                                 LikeButton(
    //                                   onTap: (isLiked) {
    //                                     return activityLikePostList(
    //                                       context,
    //                                       isLiked,
    //                                       librarylist.id,
    //                                     );
    //                                   },
    //                                   padding: EdgeInsets.only(left: 10),
    //                                   likeBuilder: (bool isLiked) {
    //                                     return Icon(
    //                                       Icons.favorite,
    //                                       color: isLiked
    //                                           ? Colors.red
    //                                           : Color(0xff073278),
    //                                     );
    //                                   },
    //                                   likeCount: 665,
    //                                 ),
    //                                 IconButton(
    //                                     icon: const Icon(
    //                                       Icons.comment_outlined,
    //                                     ),
    //                                     onPressed: () => {
    //                                           Navigator.push(
    //                                             context,
    //                                             MaterialPageRoute(
    //                                               builder: (context) =>
    //                                                   Postcomment(
    //                                                       librarylist.id,
    //                                                       commentType),
    //                                             ),
    //                                           ),
    //                                         },
    //                                     color: Color(0xff073278)),
    //                                 Text(
    //                                   '150',
    //                                   style:
    //                                       TextStyle(color: Color(0xff073278)),
    //                                 )
    //                               ]),
    //                             ],
    //                           ),
    //                         )),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             );
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

// class LibraryGetListResponse {
//   String? status;
//   String? error_code;
//   String? message;

//   List<LibraryGetList>? libraryGetList;

//   LibraryGetListResponse({
//     this.status,
//     this.error_code,
//     this.message,
//     this.libraryGetList,
//   });

//   LibraryGetListResponse.fromJson(Map<String, dynamic> json) {
//     libraryGetList = <LibraryGetList>[];
//     status = json['status'];
//     error_code = json['error_code'];
//     message = json['message'];
//     json['data'].forEach((v) {
//       libraryGetList!.add(LibraryGetList.fromJson(v));
//     });
//   }
// }

// class LibraryGetList {
//   String? id;
//   String? type;
//   String? content;
//   String? primary_link;
//   String? like_content;
//   String? like_count;
//   String? like_tooltip;

//   LibraryGetList({
//     this.id,
//     this.type,
//     this.content,
//     this.primary_link,
//     this.like_content,
//     this.like_count,
//     this.like_tooltip,
//   });

//   LibraryGetList.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     content = json['content'];
//     primary_link = json['primary_link'];
//     like_content = json['Likes']['content'];
//     if (json['Likes']['like_count'] != 0) {
//       like_count = json['Likes']['like_count'];
//     } else {
//       like_count = 0.toString();
//     }
//     like_tooltip = json['Likes']['tooltip'];
//   }

//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['type'] = type;
//     data['content'] = content;
//     data['primary_link'] = primary_link;
//     data['like_content'] = like_content;
//     data['like_count'] = like_count;
//     data['like_tooltip'] = like_tooltip;
//     return data;
//   }
// }
