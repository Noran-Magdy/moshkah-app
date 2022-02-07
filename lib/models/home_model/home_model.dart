// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.keywords,
    this.description,
    this.latestCourses,
    this.commonCourses,
    this.latestPaths,
    this.latestLectures,
    this.teachersCount,
    this.studentsCount,
  });

  String keywords;
  String description;
  List<Course> latestCourses;
  List<Course> commonCourses;
  List<LatestPath> latestPaths;
  List<LatestLecture> latestLectures;
  String teachersCount;
  String studentsCount;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        keywords: json["keywords"] == null ? null : json["keywords"],
        description: json["description"] == null ? null : json["description"],
        latestCourses: json["latest_courses"] == null
            ? null
            : List<Course>.from(
                json["latest_courses"].map((x) => Course.fromJson(x))),
        commonCourses: json["common_courses"] == null
            ? null
            : List<Course>.from(
                json["common_courses"].map((x) => Course.fromJson(x))),
        latestPaths: json["latest_paths"] == null
            ? null
            : List<LatestPath>.from(
                json["latest_paths"].map((x) => LatestPath.fromJson(x))),
        latestLectures: json["latest_lectures"] == null
            ? null
            : List<LatestLecture>.from(
                json["latest_lectures"].map((x) => LatestLecture.fromJson(x))),
        teachersCount:
            json["teachers_count"] == null ? null : json["teachers_count"],
        studentsCount:
            json["students_count"] == null ? null : json["students_count"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": keywords == null ? null : keywords,
        "description": description == null ? null : description,
        "latest_courses": latestCourses == null
            ? null
            : List<dynamic>.from(latestCourses.map((x) => x.toJson())),
        "common_courses": commonCourses == null
            ? null
            : List<dynamic>.from(commonCourses.map((x) => x.toJson())),
        "latest_paths": latestPaths == null
            ? null
            : List<dynamic>.from(latestPaths.map((x) => x.toJson())),
        "latest_lectures": latestLectures == null
            ? null
            : List<dynamic>.from(latestLectures.map((x) => x.toJson())),
        "teachers_count": teachersCount == null ? null : teachersCount,
        "students_count": studentsCount == null ? null : studentsCount,
      };
}

class Course {
  Course({
    this.id,
    this.name,
    this.about,
    this.img,
    this.imgLink,
    this.imgFullLink,
    this.categoryId,
    this.status,
    this.publishDate,
    this.languageId,
    this.teacherId,
    this.requirements,
    this.levelId,
    this.viewContent,
    this.keywords,
    this.description,
    this.telegramGroup,
    this.currentUserStatus,
    this.categoryName,
    this.courseUserId,
    this.bookIds,
    this.courseIds,
    this.pathId,
    this.file,
    this.cost,
    this.courseId,
    this.languageName,
    this.levelName,
    this.lessonCount,
    this.timeCount,
    this.teacher,
  });

  int id;
  String name;
  String about;
  String img;
  dynamic imgLink;
  String imgFullLink;
  int categoryId;
  int status;
  DateTime publishDate;
  int languageId;
  int teacherId;
  String requirements;
  int levelId;
  String viewContent;
  String keywords;
  String description;
  String telegramGroup;
  dynamic currentUserStatus;
  dynamic categoryName;
  dynamic courseUserId;
  dynamic bookIds;
  dynamic courseIds;
  dynamic pathId;
  dynamic file;
  int cost;
  dynamic courseId;
  dynamic languageName;
  dynamic levelName;
  dynamic lessonCount;
  dynamic timeCount;
  dynamic teacher;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        about: json["about"] == null ? null : json["about"],
        img: json["img"] == null ? null : json["img"],
        imgLink: json["img_link"],
        imgFullLink: json["imgFullLink"] == null ? null : json["imgFullLink"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        status: json["status"] == null ? null : json["status"],
        publishDate: json["publish_date"] == null
            ? null
            : DateTime.parse(json["publish_date"]),
        languageId: json["language_id"] == null ? null : json["language_id"],
        teacherId: json["teacher_id"] == null ? null : json["teacher_id"],
        requirements:
            json["requirements"] == null ? null : json["requirements"],
        levelId: json["level_id"] == null ? null : json["level_id"],
        viewContent: json["view_content"] == null ? null : json["view_content"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        description: json["description"] == null ? null : json["description"],
        telegramGroup:
            json["telegram_group"] == null ? null : json["telegram_group"],
        currentUserStatus: json["currentUserStatus"],
        categoryName: json["category_name"],
        courseUserId: json["courseUserId"],
        bookIds: json["book_ids"],
        courseIds: json["course_ids"],
        pathId: json["pathId"],
        file: json["file"],
        cost: json["cost"] == null ? null : json["cost"],
        courseId: json["course_id"],
        languageName: json["language_name"],
        levelName: json["level_name"],
        lessonCount: json["lesson_count"],
        timeCount: json["time_count"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "about": about == null ? null : about,
        "img": img == null ? null : img,
        "img_link": imgLink,
        "imgFullLink": imgFullLink == null ? null : imgFullLink,
        "category_id": categoryId == null ? null : categoryId,
        "status": status == null ? null : status,
        "publish_date":
            publishDate == null ? null : publishDate.toIso8601String(),
        "language_id": languageId == null ? null : languageId,
        "teacher_id": teacherId == null ? null : teacherId,
        "requirements": requirements == null ? null : requirements,
        "level_id": levelId == null ? null : levelId,
        "view_content": viewContent == null ? null : viewContent,
        "keywords": keywords == null ? null : keywords,
        "description": description == null ? null : description,
        "telegram_group": telegramGroup == null ? null : telegramGroup,
        "currentUserStatus": currentUserStatus,
        "category_name": categoryName,
        "courseUserId": courseUserId,
        "book_ids": bookIds,
        "course_ids": courseIds,
        "pathId": pathId,
        "file": file,
        "cost": cost == null ? null : cost,
        "course_id": courseId,
        "language_name": languageName,
        "level_name": levelName,
        "lesson_count": lessonCount,
        "time_count": timeCount,
        "teacher": teacher,
      };
}

class TeacherClass {
  TeacherClass({
    this.id,
    this.name,
  });

  int id;
  Name name;

  factory TeacherClass.fromJson(Map<String, dynamic> json) => TeacherClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
      };
}

enum Name { TEACHER, BEGINER }

final nameValues =
    EnumValues({"Beginer": Name.BEGINER, "teacher": Name.TEACHER});

class LatestLecture {
  LatestLecture({
    this.id,
    this.name,
    this.content,
    this.duration,
    this.about,
    this.keywords,
    this.description,
    this.img,
    this.link,
    this.category,
    this.lecTeacher,
  });

  int id;
  String name;
  String content;
  int duration;
  String about;
  String keywords;
  String description;
  String img;
  String link;
  TeacherClass category;
  TeacherClass lecTeacher;

  factory LatestLecture.fromJson(Map<String, dynamic> json) => LatestLecture(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        content: json["content"] == null ? null : json["content"],
        duration: json["duration"] == null ? null : json["duration"],
        about: json["about"] == null ? null : json["about"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        description: json["description"] == null ? null : json["description"],
        img: json["img"] == null ? null : json["img"],
        link: json["link"] == null ? null : json["link"],
        category: json["category"] == null
            ? null
            : TeacherClass.fromJson(json["category"]),
        lecTeacher: json["lec_teacher"] == null
            ? null
            : TeacherClass.fromJson(json["lec_teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "content": content == null ? null : content,
        "duration": duration == null ? null : duration,
        "about": about == null ? null : about,
        "keywords": keywords == null ? null : keywords,
        "description": description == null ? null : description,
        "img": img == null ? null : img,
        "link": link == null ? null : link,
        "category": category == null ? null : category.toJson(),
        "lec_teacher": lecTeacher == null ? null : lecTeacher.toJson(),
      };
}

class LatestPath {
  LatestPath({
    this.id,
    this.name,
    this.about,
    this.status,
    this.img,
    this.publishDate,
    this.categoryId,
    this.languageId,
    this.keywords,
    this.description,
    this.viewContent,
    this.cost,
  });

  int id;
  String name;
  String about;
  int status;
  String img;
  DateTime publishDate;
  int categoryId;
  int languageId;
  String keywords;
  String description;
  int viewContent;
  int cost;

  factory LatestPath.fromJson(Map<String, dynamic> json) => LatestPath(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        about: json["about"] == null ? null : json["about"],
        status: json["status"] == null ? null : json["status"],
        img: json["img"] == null ? null : json["img"],
        publishDate: json["publish_date"] == null
            ? null
            : DateTime.parse(json["publish_date"]),
        categoryId: json["category_id"] == null ? null : json["category_id"],
        languageId: json["language_id"] == null ? null : json["language_id"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        description: json["description"] == null ? null : json["description"],
        viewContent: json["view_content"] == null ? null : json["view_content"],
        cost: json["cost"] == null ? null : json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "about": about == null ? null : about,
        "status": status == null ? null : status,
        "img": img == null ? null : img,
        "publish_date":
            publishDate == null ? null : publishDate.toIso8601String(),
        "category_id": categoryId == null ? null : categoryId,
        "language_id": languageId == null ? null : languageId,
        "keywords": keywords == null ? null : keywords,
        "description": description == null ? null : description,
        "view_content": viewContent == null ? null : viewContent,
        "cost": cost == null ? null : cost,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
