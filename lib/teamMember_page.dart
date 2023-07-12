import 'package:flutter/material.dart';

import 'MemberDetail_page.dart';

// 팀원 소개 페이지
class TeamMember extends StatefulWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class Teaminfo {
  final String name;
  final String mbti;
  final String advantage;
  final String cooperation;
  final String url;

  Teaminfo({
    required this.name,
    required this.mbti,
    required this.advantage,
    required this.cooperation,
    required this.url,
  });
}

class _TeamMemberState extends State<TeamMember> {
  List<Teaminfo> introList = [
    Teaminfo(
        name: "김지훈",
        mbti: "INFJ",
        advantage: "생각",
        cooperation: "경청",
        url: "https://luttoli.tistory.com/"),
  ];
  // Map<String, String> introList = {
  //   "name": "김지훈",
  //   "mbti": "INFJ",
  //   "advantage": "생각",
  //   "cooperation": "경청",
  //   "url": "https://luttoli.tistory.com/",
  // };

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
                Teaminfo member = introList[index];
                return ListTile(
                  title: Text(member.name),
                  subtitle: Text(member.mbti),
                  onTap: () {
                    // 아이템 클릭시
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MemberDetail(
                          index: index,
                          introList: [],
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
            introList.add(intro as Teaminfo);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MemberDetail(
                index: introList.indexOf(intro as Teaminfo),
                introList: [],
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
