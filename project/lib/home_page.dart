import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController subjectController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController receiverController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send a email"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Type your email'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: receiverController,
                  decoration: InputDecoration(labelText: 'Type your receiver'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(labelText: 'Type your message'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 200,
                // padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    print(emailController.text);
                    final Email email = Email(
                      body: messageController.text,
                      subject: subjectController.text,
                      recipients: [receiverController.text],
                      cc: [emailController.text],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(email);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
