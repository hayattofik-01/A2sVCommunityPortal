import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/format_date_and_time.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/contest_detail.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpcommingContests extends StatelessWidget {
  const UpcommingContests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingContestsBloc, UpcomingContestsState>(
      builder: (context, state) {
        if (state is UpcomingContestsLoading) {
          return Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: const CircularProgressIndicator(),
          );
        } else if (state is UpcomingContestsLoaded) {
          if (state.upcomingContests.isEmpty) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Center(
                child: Text(
                  "No Upcomming Contests",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: greyTextColor),
                ),
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                for (var contest in state.upcomingContests)
                  GestureDetector(
                    onTap: () => context.push('/contests/detail', extra: contest),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: CustomListTile(
                        header: contest.title,
                        date: formatDateAndTime(contest.date)['date'] ?? "",
                        time: formatDateAndTime(contest.date)['time'] ?? "",
                      ),
                    ),
                  )
              ],
            );
          }
        } else if (state is UpcomingContestsError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
