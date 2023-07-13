// 팀원 소개 페이지
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';

import 'enroll_page.dart';

// List<String> infoList = ['', '', '', '', ''];

class TeamMember extends StatefulWidget {
  //상태 변경
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EnrollService>(
      builder: (context, enrollService, child) {
        // enrollService 부터 memberList 가져오기
        List<Enroll> memberList = enrollService.memberList;

        return Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('팀원 소개'),
            ),
            body: memberList.isEmpty
                ? Center(
                    child: Text(
                      '팀원을 등록해주세요.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: memberList.length,
                    itemBuilder: (context, index) {
                      Enroll enroll =
                          memberList[index]; // index에 해당하는 memberlist 가져오기
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          top: 15,
                          bottom: 3,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // 이미지 클릭 시 디테일페이지로 이동
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MemberAdd(
                                      index: memberList.indexOf(enroll),
                                      memberList: memberList,
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  "https://cdn2.thecatapi.com/images/6bt.jpg",
                                  width: 150,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 13),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 7),
                                  Text(
                                    '이름 : ${enroll.name}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'MBTI : ${enroll.mbti}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '장점 : ${enroll.advantage}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '협업스타일 : ${enroll.style}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'URL : ${enroll.url}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Enroll enroll = Enroll(
                    name: "", mbti: "", advantage: "", style: "", url: "");
                setState(() {
                  memberList.add(enroll);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberAdd(
                      index: memberList.indexOf(enroll),
                      memberList: [],
                    ),
                  ),
                );
              },
              backgroundColor: Color(0xFFFF7E36),
              elevation: 1,
              child: Icon(
                Icons.add_rounded,
                size: 36,
              ),
            ),
          );
        });
      },
    );
  }
}
