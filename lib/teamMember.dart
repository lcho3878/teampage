// team_member.dart

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:teampage/enroll_service.dart';
import 'package:teampage/member_delete.dart';

import 'detail_page.dart';
import 'enroll_page.dart';

class TeamMember extends StatefulWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  State<TeamMember> createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EnrollService>(
      builder: (context, enrollService, child) {
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
                    Enroll enroll = memberList[index];

                    return Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () {
                            enrollService.deleteMember(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("멤버가 삭제 되었습니다!")));
                          },
                        ),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Padding(

//         return Builder(builder: (context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('팀원 소개'),
//             ),
//             body: memberList.isEmpty
//                 ? Center(
//                     child: Text(
//                       '팀원을 등록해주세요.',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: memberList.length,
//                     itemBuilder: (context, index) {
//                       Enroll enroll =
//                           memberList[index]; // index에 해당하는 memberlist 가져오기
//                       return Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          top: 15,
                          bottom: 3,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          // 이미지 클릭 시 디테일페이지로 이동
                          children: [
                            Container(
                              width: 150,
                              height: 180,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => MemberDetail(
                                        index: memberList.indexOf(enroll),
                                        memberList: memberList,
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(enroll.imagepath),
                                    fit: BoxFit.cover,
                                  ),
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
                                            builder: (context) => WebViewPage(
                                                url: '${enroll.url}'),
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
                  MaterialPageRoute(
                    builder: (context) => MemberAdd(
                      memberList: memberList,
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
