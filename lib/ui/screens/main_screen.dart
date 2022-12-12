import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_hate_list/bloc/events.dart';
import 'package:personal_hate_list/bloc/states.dart';
import 'package:personal_hate_list/model/user.dart';
import 'package:personal_hate_list/ui/widgets/custom_button.dart';
import 'package:personal_hate_list/ui/widgets/custom_text_field.dart';

import '../../bloc/bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // BlocBuilder, BlocConsumer
    return BlocListener<UsersBloc, UsersState>(
      listener: (BuildContext context, state) {
        if (state is UsersLoadedState) {
          print(state.users);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Welcome to your personal hate list",
                  style: TextStyle(fontSize: 30)),
            ),
            CustomTextField(
              textEditingController: _nameController,
              maxLines: 1,
              maxLength: 20,
              hintText: "Enter name",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
                textEditingController: _ageController,
                maxLines: 1,
                maxLength: 3,
                hintText: "Enter age",
                keyboardType: TextInputType.number,
                filterTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ]),
            CustomButton(onPressed: _sendToHell, buttonText: "Send to hell 👹"),
            CustomButton(
                onPressed: _cleanUsers, buttonText: "Pardon everyone 👼"),
            BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
              if (state is UsersInitState) {
                return Expanded(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Lottie.asset("assets/loader2.json")),
                );
              } else if (state is UsersLoadedState) {
                List<User> userss = state.users;
                return Expanded(
                    child: userss.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              //final result = userss[index];
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: ListTile(
                                  leading: Text(
                                    userss[index].id.toString(),
                                    //style: TextStyle(fontSize: 16),
                                  ),
                                  title: Text(
                                    userss[index].name,
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                  trailing: Text(userss[index].age.toString(),
                                      style: const TextStyle(fontSize: 25)),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) => const SizedBox(
                              height: 5,
                            ),
                            itemCount: userss.length,
                            shrinkWrap: true,
                          )
                        : Center(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Image.asset("assets/cauldron.png"),
                                const SizedBox(height: 10),
                                const Text(
                                  "Your hell cauldron is empty",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ));
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }

  void _sendToHell() {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: const Text('Fill the name and age fields'),
                actions: [
                  TextButton(
                      onPressed: (() => Navigator.pop(context, 'OK')),
                      child: const Text('OK')),
                ],
              ));
    } else {
      final bloc = BlocProvider.of<UsersBloc>(context);
      bloc.add(
        AddUserEvent(
          User(
            name: _nameController.text,
            age: int.parse(_ageController.text),
          ),
        ),
      );
      _nameController.clear();
      _ageController.clear();
    }
  }

  void _cleanUsers() {
    final bloc = BlocProvider.of<UsersBloc>(context);
    bloc.add(CleanUsersEvent());
  }
}
