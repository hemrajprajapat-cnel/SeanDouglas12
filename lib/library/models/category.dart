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
  int? id;
  String? post_title;
  String? post_content;
  String? image;  

  LibraryGetList({
    this.id,
    this.post_title,
    this.post_content,
    this.image    
  });

  LibraryGetList.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    post_title = json['post_title'];
    post_content = json['post_content'];
    image = json['image'];    
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_title'] = post_title;
    data['post_content'] = post_content;
    data['image'] = image;  
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
