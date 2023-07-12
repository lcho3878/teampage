import 'package:flutter/material.dart';

import 'main.dart';

// Memo 데이터의 형식을 정해줍니다. 추후 isPinned, updatedAt 등의 정보도 저장할 수 있습니다.
class Intro {
  Intro({
    required this.content,
  });

  String content;
}

// Memo 데이터는 모두 여기서 관리
class TeamService extends ChangeNotifier {
  List<Intro> introList = [
    Intro(content: '장보기 목록: 사과, 양파'), // 더미(dummy) 데이터
    Intro(content: '새 메모'), // 더미(dummy) 데이터
  ];
}
