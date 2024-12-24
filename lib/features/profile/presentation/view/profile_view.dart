import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'package:tasky/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:clipboard/clipboard.dart'; // Import clipboard package

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {  
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: (){
                context.pop();
              }, 
              icon: SvgPicture.asset('assets/images/arrow_back.svg')
            ),
          ),
          body: state is GetUserLoading
              ? const CircularProgressIndicator()
              : state is GetUserSuccess
                  ? Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileField('NAME', 'state.user.displayName', context),
                SizedBox(height: 16.0),
                _buildProfileField('PHONE', '+20 123 456-7890', context),
                SizedBox(height: 16.0),
                _buildProfileField('LEVEL', 'Senior', context),
                SizedBox(height: 16.0),
                _buildProfileField('YEARS OF EXPERIENCE', '7 years', context),
                SizedBox(height: 16.0),
                _buildProfileField('LOCATION', 'Fayyum, Egypt', context),
              ],
            ),
          ) :Container()
        );
      },
    );
  }

  void copyToClipboard(String text, BuildContext context) {
    FlutterClipboard.copy(text).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Text copied to clipboard!')),
      );
    });
  }

  Widget _buildProfileField(String title, String value , BuildContext ctx) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff2F2F2F66).withOpacity(0.4),
              fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff2F2F2F66).withOpacity(0.6),
                  fontWeight: FontWeight.w700),
              ),
              title =='PHONE'?  IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () => copyToClipboard(value, ctx),
                      tooltip: 'Copy text to clipboard',
                    ):SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
