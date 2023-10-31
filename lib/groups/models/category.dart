// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks, unused_local_variable

///////////// GroupFeed API Calling /////////////

class FeedGetListResponse {
  String? status;
  String? error_code;
  String? message;
  List<FeedGetList>? feedGetList;

  FeedGetListResponse({
    this.status,
    this.error_code,
    this.message,
    this.feedGetList,
  });

  FeedGetListResponse.fromJson(Map<String, dynamic> json) {
    feedGetList = <FeedGetList>[];
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];
    json['data'].forEach((v) {
      feedGetList!.add(FeedGetList.fromJson(v));
    });
  }
}

class FeedGetList {
  String? id;
  String? user_name;
  String? type;
  String? content;
  String? primary_link;
  String? date_recorded;
  String? image_link;
  int? total_comment;
  String? like_content;
  String? like_count;
  String? like_tooltip;
  bool? like_c_user;

  FeedGetList({
    this.id,
    this.user_name,
    this.type,
    this.content,
    this.primary_link,
    this.date_recorded,
    this.image_link,
    this.total_comment,
    this.like_content,
    this.like_count,
    this.like_tooltip,
    this.like_c_user,
  });

  FeedGetList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_name = json['user_name'];
    type = json['type'];
    content = json['content'];
    primary_link = json['primary_link'];
    date_recorded = json['date_recorded'];
    image_link = json['Image_link'];
    total_comment = json['total_comment'];
    like_content = json['Likes']['content'];
    like_c_user = json['Likes']['like_c_user'];
    if (json['Likes']['like_count'] != 0) {
      like_count = json['Likes']['like_count'];
    } else {
      like_count = 0.toString();
    }
    like_tooltip = json['Likes']['tooltip'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = user_name;
    data['type'] = type;
    data['content'] = content;
    data['primary_link'] = primary_link;
    data['date_recorded'] = date_recorded;
    data['image_link'] = image_link;
    data['total_comment'] = total_comment;
    data['like_content'] = like_content;
    data['like_count'] = like_count;
    data['like_tooltip'] = like_tooltip;
    data['like_c_user'] = like_c_user;
    return data;
  }
}

///////////// GroupDiscussions API Calling /////////////

class DiscussionsListResponse {
  String? status;
  String? error_code;
  String? message;
  List<DiscussionsPostList>? discussionsPostList;

  DiscussionsListResponse({
    this.status,
    this.error_code,
    this.message,
    this.discussionsPostList,
  });

  DiscussionsListResponse.fromJson(Map<String, dynamic> json) {
    discussionsPostList = <DiscussionsPostList>[];
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];

    json['data'].forEach((v) {
      discussionsPostList!.add(DiscussionsPostList.fromJson(v));
    });
  }
}

class DiscussionsPostList {
  String? id;
  String? user_name;
  String? user_image;
  String? title;
  String? primary_link;
  String? date_recorded;
  int? total_member;

  DiscussionsPostList(
      {this.id,
      this.user_name,
      this.user_image,
      this.title,
      this.primary_link,
      this.date_recorded,
      this.total_member});

  DiscussionsPostList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_name = json['user_name'];
    user_image = json['user_image'];
    title = json['Title'];
    primary_link = json['primary_link'];
    date_recorded = json['date_recorded'];
    total_member = json['Total_member'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = user_name;
    data['user_image'] = user_image;
    data['Title'] = title;
    data['primary_link'] = primary_link;
    data['date_recorded'] = date_recorded;
    data['Total_member'] = total_member;

    return data;
  }
}

///////////// SingleGroup API Calling /////////////

class SingleGroupDetailResponse {
  String? status;
  String? error_code;
  String? message;
  List<SingleGroupList>? singleGroupList;

  SingleGroupDetailResponse({
    this.status,
    this.error_code,
    this.message,
    this.singleGroupList,
  });

  SingleGroupDetailResponse.fromjson(Map<String, dynamic> json) {
    singleGroupList = <SingleGroupList>[];
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];

    singleGroupList =
        (json['data'] as List).map((e) => SingleGroupList.fromjson(e)).toList();
  }
}

class SingleGroupList {
  String? id;
  String? type;
  String? title;
  String? content;
  String? status;
  String? time;
  String? organizer_image;
  String? organizer;
  String? have_in_group;
  String? image_link;
  int? forum_id;

  SingleGroupList({
    this.id,
    this.type,
    this.title,
    this.content,
    this.status,
    this.time,
    this.organizer_image,
    this.organizer,
    this.have_in_group,
    this.image_link,
    this.forum_id,
  });

  SingleGroupList.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['Title'];
    content = json['Content'];
    status = json['Status'];
    time = json['Time'];
    organizer_image = json['organizer_image'];
    organizer = json['organizer'];
    have_in_group = json['Have_in_group'];
    image_link = json['Image_link'];
    forum_id = json['forum_id'];
  }
}

///////////// joinGroup API Calling /////////////
class JoinGroupResponse {
  JoinGroupResponse({
    this.status,
    this.error_code,
    this.data,
    this.message,
  });

  String? status;
  String? error_code;
  int? data;
  String? message;

  factory JoinGroupResponse.fromJson(Map<String, dynamic> json) {
    return JoinGroupResponse(
        status: json["status"],
        error_code: json["error_code"],
        data: json["data"],
        message: json["message"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "error_code": error_code,
      "data": data,
      "message": message,
    };
  }
}

class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'User interface Design',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'User interface Design',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}

class GroupListResponse {
  String? status;
  String? error_code;
  List<ListGetGroup>? listGetGroup;

  GroupListResponse({
    this.status,
    this.error_code,
    this.listGetGroup,
  });

  GroupListResponse.fromjson(Map<String, dynamic> json) {
    listGetGroup = <ListGetGroup>[];
    status = json['status'];
    error_code = json['error_code'];
    
    listGetGroup =
        (json['data'] as List).map((e) => ListGetGroup.fromjson(e)).toList();

  }
}

class ListGetGroup {
  String? id;
  String? type;
  String? title;
  String? status;
  String? time;
  String? image_link;
  String? author_image;
  String? user_type;
  String? user_name;

  ListGetGroup({
    this.id,
    this.type,
    this.title,
    this.status,
    this.time,
    this.image_link,
    this.author_image,
    this.user_type,
    this.user_name
  });

  ListGetGroup.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['Title'];
    status = json['Status'];
    time = json['Time'];
    image_link = json['Image_link'];
    author_image = json['author_image'];
    user_type = json['User_type'];
    user_name = json['user_name'];
  }
}
