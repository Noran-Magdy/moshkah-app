// To parse this JSON data, do
//
//     final singlePathModel = singlePathModelFromJson(jsonString);

import 'dart:convert';

SinglePathModel singlePathModelFromJson(String str) =>
    SinglePathModel.fromJson(json.decode(str));

String singlePathModelToJson(SinglePathModel data) =>
    json.encode(data.toJson());

class SinglePathModel {
  SinglePathModel({
    this.pathId,
    this.pathCat,
    this.pathAbout,
    this.pathCost,
    this.coursesCount,
    this.pathName,
    this.keywords,
    this.description,
    this.courseList,
    this.categoryId,
    this.enddedStudyOfPath,
    this.levelId,
    this.pathLang,
    this.pathImg,
    this.totalTime,
    this.pathUser,
    this.showSubscribeButton,
  });

  String pathId;
  String pathCat;
  String pathAbout;
  int pathCost;
  String coursesCount;
  String pathName;
  String keywords;
  String description;
  List<CourseList> courseList;
  dynamic categoryId;
  bool enddedStudyOfPath;
  dynamic levelId;
  String pathLang;
  String pathImg;
  int totalTime;
  PathUser pathUser;
  bool showSubscribeButton;

  factory SinglePathModel.fromJson(Map<String, dynamic> json) =>
      SinglePathModel(
        pathId: json["path_id"] == null ? null : json["path_id"],
        pathCat: json["path_cat"] == null ? null : json["path_cat"],
        pathAbout: json["path_about"] == null ? null : json["path_about"],
        pathCost: json["path_cost"] == null ? null : json["path_cost"],
        coursesCount:
            json["courses_count"] == null ? null : json["courses_count"],
        pathName: json["path_name"] == null ? null : json["path_name"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        description: json["description"] == null ? null : json["description"],
        courseList: json["courseList"] == null
            ? null
            : List<CourseList>.from(
                json["courseList"].map((x) => CourseList.fromJson(x))),
        categoryId: json["categoryId"],
        enddedStudyOfPath: json["enddedStudyOfPath"] == null
            ? null
            : json["enddedStudyOfPath"],
        levelId: json["levelId"],
        pathLang: json["path_lang"] == null ? null : json["path_lang"],
        pathImg: json["path_img"] == null ? null : json["path_img"],
        totalTime: json["total_time"] == null ? null : json["total_time"],
        pathUser: json["pathUser"] == null
            ? null
            : PathUser.fromJson(json["pathUser"]),
        showSubscribeButton: json["showSubscribeButton"] == null
            ? null
            : json["showSubscribeButton"],
      );

  Map<String, dynamic> toJson() => {
        "path_id": pathId == null ? null : pathId,
        "path_cat": pathCat == null ? null : pathCat,
        "path_about": pathAbout == null ? null : pathAbout,
        "path_cost": pathCost == null ? null : pathCost,
        "courses_count": coursesCount == null ? null : coursesCount,
        "path_name": pathName == null ? null : pathName,
        "keywords": keywords == null ? null : keywords,
        "description": description == null ? null : description,
        "courseList": courseList == null
            ? null
            : List<dynamic>.from(courseList.map((x) => x.toJson())),
        "categoryId": categoryId,
        "enddedStudyOfPath":
            enddedStudyOfPath == null ? null : enddedStudyOfPath,
        "levelId": levelId,
        "path_lang": pathLang == null ? null : pathLang,
        "path_img": pathImg == null ? null : pathImg,
        "total_time": totalTime == null ? null : totalTime,
        "pathUser": pathUser == null ? null : pathUser.toJson(),
        "showSubscribeButton":
            showSubscribeButton == null ? null : showSubscribeButton,
      };
}

class CourseList {
  CourseList({
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

  dynamic id;
  String name;
  String about;
  String img;
  dynamic imgLink;
  String imgFullLink;
  int categoryId;
  dynamic status;
  dynamic publishDate;
  int languageId;
  int teacherId;
  dynamic requirements;
  int levelId;
  dynamic viewContent;
  dynamic keywords;
  dynamic description;
  dynamic telegramGroup;
  dynamic currentUserStatus;
  String categoryName;
  int courseUserId;
  dynamic bookIds;
  dynamic courseIds;
  dynamic pathId;
  dynamic file;
  dynamic cost;
  String courseId;
  dynamic languageName;
  dynamic levelName;
  int lessonCount;
  int timeCount;
  dynamic teacher;

  factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        about: json["about"] == null ? null : json["about"],
        img: json["img"] == null ? null : json["img"],
        imgLink: json["img_link"],
        imgFullLink: json["imgFullLink"] == null ? null : json["imgFullLink"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        status: json["status"],
        publishDate: json["publish_date"],
        languageId: json["language_id"] == null ? null : json["language_id"],
        teacherId: json["teacher_id"] == null ? null : json["teacher_id"],
        requirements: json["requirements"],
        levelId: json["level_id"] == null ? null : json["level_id"],
        viewContent: json["view_content"],
        keywords: json["keywords"],
        description: json["description"],
        telegramGroup: json["telegram_group"],
        currentUserStatus: json["currentUserStatus"],
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        courseUserId:
            json["courseUserId"] == null ? null : json["courseUserId"],
        bookIds: json["book_ids"],
        courseIds: json["course_ids"],
        pathId: json["pathId"],
        file: json["file"],
        cost: json["cost"],
        courseId: json["course_id"] == null ? null : json["course_id"],
        languageName: json["language_name"],
        levelName: json["level_name"],
        lessonCount: json["lesson_count"] == null ? null : json["lesson_count"],
        timeCount: json["time_count"] == null ? null : json["time_count"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
        "about": about == null ? null : about,
        "img": img == null ? null : img,
        "img_link": imgLink,
        "imgFullLink": imgFullLink == null ? null : imgFullLink,
        "category_id": categoryId == null ? null : categoryId,
        "status": status,
        "publish_date": publishDate,
        "language_id": languageId == null ? null : languageId,
        "teacher_id": teacherId == null ? null : teacherId,
        "requirements": requirements,
        "level_id": levelId == null ? null : levelId,
        "view_content": viewContent,
        "keywords": keywords,
        "description": description,
        "telegram_group": telegramGroup,
        "currentUserStatus": currentUserStatus,
        "category_name": categoryName == null ? null : categoryName,
        "courseUserId": courseUserId == null ? null : courseUserId,
        "book_ids": bookIds,
        "course_ids": courseIds,
        "pathId": pathId,
        "file": file,
        "cost": cost,
        "course_id": courseId == null ? null : courseId,
        "language_name": languageName,
        "level_name": levelName,
        "lesson_count": lessonCount == null ? null : lessonCount,
        "time_count": timeCount == null ? null : timeCount,
        "teacher": teacher,
      };
}

class TeacherClass {
  TeacherClass({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory TeacherClass.fromJson(Map<String, dynamic> json) => TeacherClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class PathUser {
  PathUser({
    this.id,
    this.userId,
    this.pathId,
    this.regDate,
    this.status,
    this.role,
  });

  int id;
  int userId;
  int pathId;
  DateTime regDate;
  int status;
  int role;

  factory PathUser.fromJson(Map<String, dynamic> json) => PathUser(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        pathId: json["path_id"] == null ? null : json["path_id"],
        regDate:
            json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
        status: json["status"] == null ? null : json["status"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "path_id": pathId == null ? null : pathId,
        "reg_date": regDate == null ? null : regDate.toIso8601String(),
        "status": status == null ? null : status,
        "role": role == null ? null : role,
      };
}
