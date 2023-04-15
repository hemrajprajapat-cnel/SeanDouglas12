// ignore_for_file: non_constant_identifier_names

class LibraryGetListResponse {
  String? status;
  String? error_code;
  String? message;

  List<LibraryGetList>? libraryGetList;

  LibraryGetListResponse({
    this.status,
    this.error_code,
    this.message,
    this.libraryGetList,
  });

  LibraryGetListResponse.fromJson(Map<String, dynamic> json) {
    libraryGetList = <LibraryGetList>[];
    status = json['status'];
    error_code = json['error_code'];
    message = json['message'];
    json['data'].forEach((v) {
      libraryGetList!.add(LibraryGetList.fromJson(v));
    });
  }
}

class LibraryGetList {
  String? user_name;
  String? author_image;
  String? id;
  String? type;
  String? content;
  String? primary_link;
  String? like_content;
  String? like_count;
  String? like_tooltip;
  int? totel_comment;
  bool? like_c_user;

  LibraryGetList({
    this.user_name,
    this.author_image,
    this.id,
    this.type,
    this.content,
    this.primary_link,
    this.like_content,
    this.like_count,
    this.like_tooltip,
    this.totel_comment,
    this.like_c_user,
  });

  LibraryGetList.fromJson(Map<String, dynamic> json) {
    user_name = json['user_name'];
    author_image = json['author_image'];
    id = json['id'];
    type = json['type'];
    content = json['content'];
    primary_link = json['primary_link'];
    like_content = json['Likes']['content'];
    like_c_user = json['Likes']['like_c_user'];
    if (json['Likes']['like_count'] != 0) {
      like_count = json['Likes']['like_count'];
    } else {
      like_count = 0.toString();
    }
    like_tooltip = json['Likes']['tooltip'];
    totel_comment = json['total_comment'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['content'] = content;
    data['primary_link'] = primary_link;
    data['like_content'] = like_content;
    data['like_count'] = like_count;
    data['like_tooltip'] = like_tooltip;
    data['total_comment'] = totel_comment;
    data['like_c_user'] = like_c_user;
    return data;
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
      imagePath: 'assets/hotel/hotel_2.png',
      title: 'Blog one',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/images/images.png',
      title: 'Blog two',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    // Category(
    //   imagePath: 'assets/design_course/interFace3.png',
    //   title: 'App Design Course',
    //   lessonCount: 12,
    //   money: 25,
    //   rating: 4.8,
    // ),
    // Category(
    //   imagePath: 'assets/design_course/interFace4.png',
    //   title: 'Web Design Course',
    //   lessonCount: 28,
    //   money: 208,
    //   rating: 4.9,
    // ),
  ];
}
