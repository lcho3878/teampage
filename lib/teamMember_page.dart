import 'package:flutter/material.dart';
import 'package:teampage/teamAdd_page.dart';

// 팀원 소개 페이지
class TeamMember extends StatefulWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  List introList = ["d", "d", "d", "d", "d", "d"];

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
                  title: Text(
                    member,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    // 아이템 클릭시
                    print('$member : 클릭 됨');
                  },
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
  }
}
