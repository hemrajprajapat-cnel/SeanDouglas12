// ignore_for_file: non_constant_identifier_names

/////////// Event List API Model/////////////
class EventListResponse {
  bool? status;
  String? error_code;
  List<EventListData>? eventListData;

  EventListResponse({
    this.status,
    this.error_code,
    this.eventListData,
  });

  EventListResponse.fromjson(Map<String, dynamic> json) {
    eventListData = <EventListData>[];
    status = json['status'];
    error_code = json['error_code'];
    eventListData =
        (json['data'] as List).map((e) => EventListData.fromjson(e)).toList();
  }
}

class EventListData {
  String? id;
  String? display_name;
  String? event_start_date;
  String? event_end_date;
  String? event_title;
  String? event_excerpt;
  String? event_name;
  String? event_type;
  String? event_status;
  String? event_content;
  String? event_thumbnail_image_link;
  String? event_link;

  EventListData({
    this.id,
    this.display_name,
    this.event_start_date,
    this.event_end_date,
    this.event_title,
    this.event_excerpt,
    this.event_name,
    this.event_type,
    this.event_status,
    this.event_content,
    this.event_thumbnail_image_link,
    this.event_link,
  });

  EventListData.fromjson(Map<String, dynamic> json) {
    id = json['ID'];
    display_name = json['display_name'];
    event_start_date = json['event_start_date'];
    event_end_date = json['event_end_date'];
    event_title = json['event_title'];
    event_excerpt = json['event_excerpt'];
    event_name = json['event_name'];
    event_type = json['event_type'];
    event_status = json['event_status'];
    event_content = json['event_content'];
    event_thumbnail_image_link = json['event_thumbnail_image_link'];
    event_link = json['event_link'];
  }
}

class PreviousEventListResponse {
  bool? status;
  String? error_code;
  List<PreviousEventListData>? previousEventListData;

  PreviousEventListResponse({
    this.status,
    this.error_code,
    this.previousEventListData,
  });

  PreviousEventListResponse.fromjson(Map<String, dynamic> json) {
    previousEventListData = <PreviousEventListData>[];
    status = json['status'];
    error_code = json['error_code'];
    previousEventListData = (json['data'] as List)
        .map((e) => PreviousEventListData.fromjson(e))
        .toList();
  }
}

/////////// Previous Event List API Model/////////////
class PreviousEventListData {
  String? id;
  String? display_name;
  String? event_start_date;
  String? event_end_date;
  String? erv_link;
  String? event_title;
  String? event_excerpt;
  String? event_name;
  String? event_type;
  String? event_status;
  String? event_content;
  String? event_thumbnail_image_link;
  String? event_link;

  PreviousEventListData({
    this.id,
    this.display_name,
    this.event_start_date,
    this.event_end_date,
    this.erv_link,
    this.event_title,
    this.event_excerpt,
    this.event_name,
    this.event_type,
    this.event_status,
    this.event_content,
    this.event_thumbnail_image_link,
    this.event_link,
  });

  PreviousEventListData.fromjson(Map<String, dynamic> json) {
    id = json['ID'];
    display_name = json['display_name'];
    event_start_date = json['event_start_date'];
    event_end_date = json['event_end_date'];
    erv_link = json['erv_link'];
    event_title = json['event_title'];
    event_excerpt = json['event_excerpt'];
    event_name = json['event_name'];
    event_type = json['event_type'];
    event_status = json['event_status'];
    event_content = json['event_content'];
    event_thumbnail_image_link = json['event_thumbnail_image_link'];
    event_link = json['event_link'];
  }
}
