import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';

//  dialog창을 띄워 삭제확인을 하고 삭제 버튼을 누르면
//  index에 해당하는 memberlist에서 삭제 (enrollService.deleteMember함수 사용)
//  다이얼로그창 닫힘
class MemberDelete extends StatelessWidget {
  final int index;

  const MemberDelete({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EnrollService>(
      // enroll서비스 구독
      builder: (context, enrollService, child) {
        return AlertDialog(
          // 다이얼로그띄우기
          title: Text('멤버 삭제'),
          content: Text('정말로 이 멤버를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                enrollService
                    .deleteMember(index); // enrollservice파일에 있는 deletemember 함수
                Navigator.pop(context); // 다이얼로그 창 닫기
              },
              child: Text('삭제'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }
}
