//팀원 등록 페이지
import 'package:flutter/material.dart';

class MemberAdd extends StatelessWidget {
  const MemberAdd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이곳은 팀원 등록 페이지입니다'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "직책 / 이름을 입력해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "MBTI",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "장점",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "협업 스타일",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Divider(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "블로그 URL",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
