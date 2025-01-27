import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/community_bloc.dart';
import 'package:flutter_jobs_app/service/communityPageApi.dart';
import 'package:flutter_jobs_app/widgets/custom_community.dart';
import 'package:flutter_jobs_app/widgets/custom_searchFeild.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});
  static String id = 'CommunityPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc()..add(GetCommunity()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage('assets/images/light.bg.png')
                    : AssetImage('assets/images/dark_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Image.asset("assets/images/back.png")),
                      Padding(
                        padding: const EdgeInsets.only(top: 19, left: 140),
                        child: Text(
                          "Community",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomSearchTextField(
                            color: Color(0x9B3B4758),
                            hintText: "Search for Community "),
                        Container(
                          height: 49,
                          width: 56,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.25), // 25% opacity
                                  offset: Offset(0, 5), // X: 0, Y: 4
                                  blurRadius: 4, // Blur: 4
                                  spreadRadius: 0, // Spread: 0
                                ),
                              ],
                              borderRadius: BorderRadius.circular(14)),
                          child: Image.asset(
                            'assets/images/Slider.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                  if (state is Success) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Customcommunity(
                              imageCommunity: 'assets/images/FB.png',
                              nameCommunity: state.communaties[index].name,
                            ),
                            itemCount: state.communaties.length,
                          ),
                        );

                    }
                    else if (state is Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is Error) {
                        return Center(child: Text('Error loading communities'));
                      } else {
                        return Center(child: Text('No communities available'));
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
