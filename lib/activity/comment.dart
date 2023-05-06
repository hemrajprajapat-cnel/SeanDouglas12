// ignore_for_file: non_constant_identifier_names, unnecessary_statements, unused_label, must_be_immutable
import 'dart:convert';
import 'package:best_flutter_ui_templates/api/api.dart';
import 'package:best_flutter_ui_templates/comman/custome_dialog.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../comman/design_course_app_theme.dart';
import 'package:http/http.dart' as http;

class Postcomment extends StatefulWidget {
  var activity_id;
  var type;
  Postcomment(this.activity_id, this.type);

  @override
  _Postcomment createState() => _Postcomment();
}

class _Postcomment extends State<Postcomment> {
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFF063278),
          elevation: 0,
        ),
        body: Comment(id: widget.activity_id, CommentType: widget.type),
      ),
    );
  }
}

class Comment extends StatefulWidget {
  Comment({Key? key, this.id, this.CommentType}) : super(key: key);

  final id;
  final CommentType;

  @override
  _Comment createState() => _Comment();
}

class _Comment extends State<Comment> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    activityCommentGetList(
      context,
      widget.id,
      widget.CommentType,
    );
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  Widget commentChild() {
    return RefreshIndicator(
      onRefresh: () async {
        ActivityCommentPostList(
            context, commentController.text, widget.id, widget.CommentType);
      },
      child: ListView(
        children: [
          for (var i = 0; i < tempActivityComment.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        tempActivityComment[i]
                            .comment_owner_image_link
                            .toString(),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  "${tempActivityComment[i].comment_owner_name}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Html(data: tempActivityComment[i].comment_content),
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CommentBox(
          // userImage:
          //     'http://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
          child: commentChild(),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {},
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: IconButton(
              icon: Icon(
                Icons.send_sharp,
                size: 30,
              ),
              highlightColor: Colors.white,
              color: Colors.amber,
              onPressed: (() {
                ActivityCommentPostList(context, commentController.text,
                    widget.id, widget.CommentType);
              })),
        ),
      ),
    );
  }

  List<ActivityComment> activityComment = [];
  List<ActivityComment> tempActivityComment = [];

  void activityCommentGetList(BuildContext context, id, CommentType) async {
    List<ActivityCommentGetListResponse> activityCommentGetListResponse;
    isLoading = true;
    var url = baseUrl +
        ApiEndPoints().activityCommentGetList +
        "&activity_id=$id&comment_type=$CommentType";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<ActivityCommentGetListResponse> activityCommentGetListResponse = [];
      List<ActivityComment> activityComment = [];

      activityCommentGetListResponse.add(
          ActivityCommentGetListResponse.fromJson(jsonDecode(response.body)));

      ActivityCommentGetListResponse activityCommentGetListRes =
          activityCommentGetListResponse[0];

      if (activityCommentGetListRes.status == 'true' &&
          activityCommentGetListRes.error_code == '0') {
        if (activityCommentGetListRes.activityComment != null) {
          var data = activityCommentGetListRes.activityComment;

          for (var e in data!) {
            activityComment.add(e);
          }
          setState(() {
            tempActivityComment = activityComment;
          });
        }
      }
    } else {
      customDialog(context, message: "Data not found", title: 'Error');
    }
  }

  void ActivityCommentPostList(
      BuildContext context, commentController, id, CommentType) async {
    List<ActivityCommentPostResponse> activityCommentPostResponse;

    var url = baseUrl + ApiEndPoints().activityCommentPostList;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('isUserId');
    Map<String, String> qParams = {
      'task': 'add_comments',
      'activity_id': id,
      'message': commentController.toString(),
      'user_id': userId.toString(),
    };

    var response = await http.post(Uri.parse(url), body: qParams);

    if (response.statusCode == 200) {
      setState(() {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Postcomment(id, CommentType),
          ),
        );
      });
    }
  }
}

class ActivityCommentGetListResponse {
  String? status;
  String? error_code;
  String? message;
  int? total_comment;

  List<ActivityComment>? activityComment;

  ActivityCommentGetListResponse({
    this.status,
    this.error_code,
    this.message,
    this.total_comment,
    this.activityComment,
  });

  ActivityCommentGetListResponse.fromJson(Map<String, dynamic> json) {
    activityComment = <ActivityComment>[];
    status = json['status'].toString();
    error_code = json['error_code'];
    message = json['message'];
    if (json['data']['total_comment'] != 0) {
      total_comment = json['data']['total_comment'];
    } else {
      total_comment = 0;
    }

    activityComment = (json['data']['comment_list'] as List)
        .map((i) => ActivityComment.fromJson(i))
        .toList();
  }
}

class ActivityComment {
  String? comment_id;
  String? comment_type;
  String? comment_owner_name;
  String? comment_owner_image_link;
  String? comment_content;
  String? comment_primary_link;

  ActivityComment(
      {this.comment_id,
      this.comment_type,
      this.comment_owner_name,
      this.comment_owner_image_link,
      this.comment_content,
      this.comment_primary_link});

  ActivityComment.fromJson(Map<String, dynamic> json) {
    comment_id = json['comment_id'];
    comment_type = json['comment_type'];
    comment_owner_name = json['comment_owner_name'];
    comment_owner_image_link = json['comment_owner_image_link'];
    comment_content = json['comment_content'];
    comment_primary_link = json['comment_primary_link'];
  }
}

class ActivityCommentPostResponse {
  String? status;
  String? error_code;
  String? message;

  ActivityCommentPostResponse({this.status, this.error_code, this.message});

  ActivityCommentPostResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];
  }
}
