import 'dart:convert';

import 'main.dart';
import 'package:flutter/material.dart';

// 데이터 형식을 지정
class Enroll {
  String name;
  String mbti;
  String advantage;
  String style;
  String url;
  String imagepath;

// 생성자
  Enroll({
    required this.name,
    required this.mbti,
    required this.advantage,
    required this.style,
    required this.url,
    required this.imagepath,
  });

  Map toJson() {
    return {
      'name': name,
      'mbti': mbti,
      'advantage': advantage,
      'style': style,
      'url': url,
      'imagepath': imagepath,
    };
  }

  factory Enroll.fromJson(json) {
    return Enroll(
      name: json['name'] ?? '',
      mbti: json['mbti'] ?? '',
      advantage: json['advantage'] ?? '',
      style: json['style'] ?? '',
      url: json['url'] ?? '',
      imagepath: json['imagepath'] ?? '',
    );
  }
}

// enroll 데이터는 모두 여기서 관리
class EnrollService with ChangeNotifier {
  EnrollService() {
    loadMemberList();
  }

// 더미 데이터
  List<Enroll> memberList = [
// Enroll(name: '이름', mbti: 'intj', advantage: '', style: '', url: ''),
// Enroll(name: '이름', mbti: 'intj', advantage: '', style: '', url: ''),
  ];

// 수정 기능
  saveMember({
// 네이밍 고려
    required int index,
    required String name,
    required String mbti,
    required String advantage,
    required String style,
    required String url,
    // required String imagepath
  }) {
    memberList[index].name = name; // 인덱스 받아서 덮어쓰기
    memberList[index].mbti = mbti;
    memberList[index].advantage = advantage;
    memberList[index].style = style;
    memberList[index].url = url;
    // memberList[index].imagepath = imagepath;

    notifyListeners(); // Consumer<enrollService>의 builder 부분을 호출해서 화면 새로고침
    saveMemberList();
  }

// 등록 기능
  createMember({
// 네이밍 고려
    required String name,
    required String mbti,
    required String advantage,
    required String style,
    required String url,
    required String imagepath,
  }) {
    Enroll enroll = Enroll(
      name: name,
      mbti: mbti,
      advantage: advantage,
      style: style,
      url: url,
      imagepath: imagepath,
    );
    memberList.add(enroll);
    notifyListeners(); // Consumer<enrollService>의 builder 부분을 호출해서 화면 새로고침
    saveMemberList();
  }

// 저장 기능
  saveMemberList() {
    List memberJsonList = memberList.map((memo) => memo.toJson()).toList();
// [{"content": "1"}, {"content": "2"}]

    String jsonString = jsonEncode(memberJsonList);
// '[{"content": "1"}, {"content": "2"}]'

    prefs.setString('memberList', jsonString);
  }

  loadMemberList() {
    String? jsonString = prefs.getString('memberList');
// '[{"content": "1"}, {"content": "2"}]'

    if (jsonString == null) return; // null 이면 로드하지 않음

    List memberJsonList = jsonDecode(jsonString);
// [{"content": "1"}, {"content": "2"}]

    memberList = memberJsonList.map((json) => Enroll.fromJson(json)).toList();
  }

  // 삭제 함수
  void deleteMember(int index) {
    memberList.removeAt(index);
    saveMemberList();
    notifyListeners();
  }
}
