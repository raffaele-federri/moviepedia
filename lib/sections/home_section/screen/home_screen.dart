import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/utils/app_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you want to watch ?',
                  style: AppTextStyles.white18w500),
              AppUtils.kGap24,
              SizedBox(
                height: 210,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: index == 0 ? 0 : 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.amber,
                      ),
                      height: 210,
                      width: 144,
                      child: Center(child: Text(index.toString())),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
