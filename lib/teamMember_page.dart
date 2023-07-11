import 'package:flutter/material.dart';

import 'MemberDetail_page.dart';

// 팀원 소개 페이지
class TeamMember extends StatefulWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  List<String> introList = [
    "김지훈",
    "INFJ",
    "끈기",
    "경청",
    "https://luttoli.tistory.com/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팀원 소개'),
      ),
      body: introList.isEmpty
          ? Center(child: Text("없어요"))
          : ListView.builder(
              itemCount: introList.length,
              itemBuilder: (context, index) {
                String member = introList[index];
                return ListTile(
                  title: Text(member),
                  onTap: () {
                    // 아이템 클릭시
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MemberDetail(
                          index: index,
                          introList: introList,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String intro = '';
          setState(() {
            introList.add(intro);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MemberDetail(
                index: introList.indexOf(intro),
                introList: introList,
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
  }
}
