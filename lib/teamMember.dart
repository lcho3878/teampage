// 팀원 소개 페이지
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'enroll_page.dart';

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
                        children: [
                          // 디테일 페이지 이동
                          Container(
                            width: 150,
                            height: 180,
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MemberAdd(
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: Image.file(
                                File(enroll.imagepath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 13),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 3),
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
                                  GestureDetector(
                                    child: Text(
                                      'URL : ${enroll.url}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WebViewPage(url: '${enroll.url}'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemberAdd()),
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
      },
    );
  }
}

// 웹뷰(url 링크)
class WebViewPage extends StatelessWidget {
  WebViewPage({super.key, required this.url});

  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(url),
      ),
      body: WebView(initialUrl: url),
    );
  }
}
