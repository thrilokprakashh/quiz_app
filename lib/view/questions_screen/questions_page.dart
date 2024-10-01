import 'package:flutter/material.dart';
import 'package:quiz_app/models/utils/constans/color_constants.dart';
import 'package:quiz_app/view/dummyDb.dart';

class questions_page extends StatefulWidget {
  const questions_page({super.key});

  @override
  State<questions_page> createState() => _questions_pageState();
}

class _questions_pageState extends State<questions_page> {
  int questionIndex = 0;
  int? selectedAns;
  int? correctAns;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.black,
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          actions: [
            Text(
              "${questionIndex + 1} / ${Dummydb.questionList.length}",
              style: TextStyle(color: ColorConstants.textColor),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      Dummydb.questionList[questionIndex]["question"],
                      style: TextStyle(
                          color: ColorConstants.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedAns = index;
                          correctAns = Dummydb.questionList[questionIndex]
                              ["answerIndex"];
                          if (Dummydb.questionList[questionIndex]["options"]
                                  [selectedAns] ==
                              correctAns) {
                          } else {}
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedAns == index
                                  ? (selectedAns == correctAns
                                      ? ColorConstants.rightAnsColor
                                      : ColorConstants.wrongAnsColor)
                                  : ColorConstants.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Dummydb.questionList[questionIndex]["options"]
                                  [index],
                              style: TextStyle(
                                  color: ColorConstants.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: ColorConstants.textColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => setState(() {
                  if (questionIndex < Dummydb.questionList.length - 1) {
                    questionIndex++;
                    selectedAns = null;
                  }
                }),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstants.grey),
                  child: Center(
                    child: Text("Next"),
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
