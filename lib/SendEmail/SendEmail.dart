
import 'dart:io';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class EmailSender
{
  Future Send(File file,String recipients)async
  {
    final MailOptions mailOptions = MailOptions(
      body: 'email body ',
      subject: 'the Email Subject',
      recipients: [recipients],
      isHTML: false,
      attachments: [file.path],
    );
    String platformResponse;
    final MailerResponse response = await FlutterMailer.send(mailOptions);
    switch (response) {
      case MailerResponse.saved: /// ios only
        platformResponse = 'mail was saved to draft';
        break;
      case MailerResponse.sent: /// ios only
        platformResponse = 'mail was sent';
        break;
      case MailerResponse.cancelled: /// ios only
        platformResponse = 'mail was cancelled';
        break;
      case MailerResponse.android:
        platformResponse = 'intent was successful';
        break;
      default:
        platformResponse = 'unknown';
        break;
    }
    print(platformResponse);


  }
}