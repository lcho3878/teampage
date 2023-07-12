import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';

class MemberDelete extends StatelessWidget {
  final int index;

  const MemberDelete({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EnrollService>(
      builder: (context, enrollService, child) {
        return AlertDialog(
          title: Text('멤버 삭제'),
          content: Text('정말로 이 멤버를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                enrollService.deleteMember(index);
                Navigator.pop(context);
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
