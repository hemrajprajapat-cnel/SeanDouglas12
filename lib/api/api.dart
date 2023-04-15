// ignore_for_file: non_constant_identifier_names

final baseUrl = 'https://ofclearn.com/wp-json/coinapi';
DateTime current_date = DateTime.now();

class ApiEndPoints {
  final String login = '/v1/mobile?task=login';
  final String register = '/v1/mobile?task=register';
  final String fPassowrd = '/v1/mobile?task=fpassword';
  final String editprofile = '/v1/mobile?task=edit_profile';
  final String uploadprofilephoto =
      '/v1/mobile?task=upload_profile_photo&time=${current_date}';
  final String uploadcoverphoto = '/v1/mobile?task=upload_cover_photo';

  /// Activity  Screens ////
  final String activityCommentGetList = '/v1/mobile?task=get_comment_list';
  final String activityCommentPostList = '/v1/mobile?task=add_comments';
  final String activityLikePostList = '/v1/mobile?task=like_count_api';
  final String activityAddPost = '/v1/mobile?task=add_post_api';
  final String activityPostList = '/v1/mobile?task=activity_post_list';

  //// Course Screens ////
  final String courseList = '/v1/mobile?task=get_course_list_api';
  final String singleCourseDetail = '/v1/mobile?task=single_course_detail';

  //// Library  Screens /////
  final String libraryGetList = '/v1/mobile?task=library_post_list';

  //// Groups  Screens /////
  final String getGroupList = '/v1/mobile';
  final String getGroupList2 = '/v1/mobile';
  final String getGroupDetails = '/v1/mobile?task=signle_group_details';
  final String joinGroup = '/v1/mobile?task=join_group_by_id';
  final String discussionsPostList =
      '/v1/mobile?task=feed_and_discussions_group_list';
  final String add_dicuscsions = '/v1/mobile?task=add_dicuscsions';
  final String feedGroupGetList =
      '/v1/mobile?task=feed_and_discussions_group_list';
  final String changegroupimage = '/v1/mobile?task=change_group_image';

  //// Event  Screens /////
  final String eventList = '/v1/mobile?task=event_list_api';
  final String previousEventList = '/v1/mobile?task=pervious_event_list_api';

  final String previusCourseList = '/v1/mobile?task=get_my_course_list';

  final String connectionGetList = '/v1/mobile?task=get_connection';
  final String getLernerList = '/v1/mobile?task=get_lerner_level';
  final String profileGetList = '/v1/mobile?task=get_user_details';
}
