// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks, unused_local_variable

/////////// Activity List API Model/////////////
class ActivityPostListResponse {
  String? status;
  String? error_code;
  String? message;
  List<ActivityPostList>? activityPostList;

  ActivityPostListResponse({
    this.status,
    this.error_code,
    this.message,
    this.activityPostList,
  });

  ActivityPostListResponse.fromJson(Map<String, dynamic> json) {
    activityPostList = <ActivityPostList>[];
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];
    json['data'].forEach((v) {
      activityPostList!.add(ActivityPostList.fromJson(v));
    });
  }
}

class ActivityPostList {
  String? id;
  String? user_name;
  String? author_image;
  String? type;
  String? content;
  String? primary_link;
  String? date_recorded;
  String? image_link;
  int? total_comment;
  String? like_content;
  String? like_count;
  bool? like_c_user;

  // String? like_tooltip;

  ActivityPostList({
    this.id,
    this.user_name,
    this.author_image,
    this.type,
    this.content,
    this.primary_link,
    this.date_recorded,
    this.image_link,
    this.total_comment,
    this.like_content,
    this.like_count,
    this.like_c_user,

    // this.like_tooltip,
  });

  ActivityPostList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_name = json['user_name'];
    author_image = json['author_image'];
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
    // like_tooltip = json['Likes']['tooltip'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = user_name;
    data['author_image'] = author_image;
    data['type'] = type;
    data['content'] = content;
    data['primary_link'] = primary_link;
    data['date_recorded'] = date_recorded;
    data['image_link'] = image_link;
    data['total_comment'] = total_comment;
    data['like_content'] = like_content;
    data['like_count'] = like_count;
    data['like_c_user'] = like_c_user;
    // data['like_tooltip'] = like_tooltip;
    return data;
  }
}

/////////// Like Count API Model/////////////
class ActivityLikePostListResponse {
  String? status;
  String? error_code;
  String? content;
  String? like_count;
  bool? like_c_user;
  // String? tooltip;
  int? fav_count;

  ActivityLikePostListResponse({
    this.status,
    this.error_code,
    this.content,
    this.like_count,
    // this.tooltip,
    this.fav_count,
    this.like_c_user,
  });

  ActivityLikePostListResponse.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    error_code = json['error_code'];
    content = json['Data']['content'];
    like_c_user = json['Data']['like_c_user'];
    if (json['Data']['like_count'] != 0) {
      like_count = json['Data']['like_count'];
    } else {
      like_count = 0.toString();
    }
    // tooltip = json['Data']['tooltip'];

    fav_count = json['Data']['fav_count'];
  }
}
