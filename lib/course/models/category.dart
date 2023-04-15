// ignore_for_file: non_constant_identifier_names

/////////// Course List API Model /////////////
class CourseListResponse {
  bool? status;
  String? error_code;
  List<ListCourse>? listCourse;

  CourseListResponse({
    this.status,
    this.error_code,
    this.listCourse,
  });

  CourseListResponse.fromjson(Map<String, dynamic> json) {
    listCourse = <ListCourse>[];
    status = json['status'];
    error_code = json['error_code'];
    listCourse =
        (json['data'] as List).map((e) => ListCourse.fromjson(e)).toList();
  }
}

class ListCourse {
  String? id;
  String? post_author;
  String? post_author_name;
  String? post_title;
  String? post_excerpt;
  String? post_status;
  String? post_name;
  String? post_type;
  String? post_price;
  String? post_thumbnail_link;
  String? post_link;

  ListCourse({
    this.id,
    this.post_author,
    this.post_author_name,
    this.post_title,
    this.post_excerpt,
    this.post_status,
    this.post_name,
    this.post_type,
    this.post_price,
    this.post_thumbnail_link,
    this.post_link,
  });

  ListCourse.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    post_author = json['post_author'];
    post_author_name = json['post_author_name'];
    post_title = json['post_title'];
    post_excerpt = json['post_excerpt'];
    post_status = json['post_status'];
    post_name = json['post_name'];
    post_type = json['post_type'];
    post_price = json['post_price'];
    post_thumbnail_link = json['post_thumbnail_link'];
    post_link = json['post_link'];
  }
}

/////////// Demo List API Model/////////////
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
}
