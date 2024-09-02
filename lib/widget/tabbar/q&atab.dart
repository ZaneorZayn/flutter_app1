import 'package:flutter/material.dart';

import '../../model/q&a_model.dart';
import '../../screen/blogscreen.dart';

class QnATab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: fakeQnA.length,
      itemBuilder: (context, index) {
        final qna = fakeQnA[index];
        return QnAWidget(qna: qna);
      },
    );
  }
}