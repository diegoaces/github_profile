import 'package:flutter/material.dart';
import 'package:github_profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInputField extends StatefulWidget {
  @override
  _UserNameInputFieldState createState() => _UserNameInputFieldState();
}

class _UserNameInputFieldState extends State<UserNameInputField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onSubmitted: (value) =>
                    submitUserName(context, _controller.text),
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search User Here',
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void submitUserName(BuildContext context, String userName) {
    //https://github.com/felangel/bloc/issues/587
    // ignore: close_sinks
    final profileBloc = context.bloc<ProfileBloc>();
    profileBloc.add(GetUser(userName));
  }
}
