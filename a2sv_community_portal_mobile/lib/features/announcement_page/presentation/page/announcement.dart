import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/page/custom_tile.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/page/detail.dart';

import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/uppe_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/announcement_bloc.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          const UpperBar(
            title: 'Announcemet',
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AnnouncementBloc, AnnouncementState>(
            builder: (context, state) {
              if (state is AnnouncementLoading) {
                return Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is AnnouncementLoaded) {
                return Column(
                  children: <Widget>[
                    for (var announcement in state.announcements)
                      GestureDetector(
                        onTap: () =>
                            context.push("/announcement/detail", extra: announcement),
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AnnouncementDetailsPage(
                        //             title: data.title,
                        //             description: data.description))),
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: CustomListTile(
                              header: announcement.title,
                              description: announcement.description,
                              isRead: true,
                              type: "",
                            )),
                      )
                  ],
                );
              } else if (state is AnnouncementError) {
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text(
                      "No Recent Announcements",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: greyTextColor),
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text(
                      "No Recent Announcements",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: greyTextColor),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
