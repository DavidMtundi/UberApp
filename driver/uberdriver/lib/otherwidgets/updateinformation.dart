import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/providers/user.dart';

import 'customtextformfield.dart';

class UpdateInformation extends StatelessWidget {
  const UpdateInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Update Information",
                      style: _theme.textTheme.titleMedium!.merge(
                        const TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _updateProfileForm(context),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45.0,
              child: FlatButton(
                color: _theme.primaryColor,
                onPressed: () {},
                child: const Text(
                  "SAVE INFORMATION",
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _updateProfileForm(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextFormField(
                givencontroller: authProvider.name,
                hintText: "First name",
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: CustomTextFormField(
                givencontroller: authProvider.lastname,
                hintText: "Last name",
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        CustomTextFormField(
          hintText: "Email",
          givencontroller: authProvider.email,
        ),
        const SizedBox(
          height: 20.0,
        ),
        CustomTextFormField(
          givencontroller: authProvider.password,
          hintText: "Password",
        ),
      ],
    );
  }
}
