// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordwave/components/utils/appBarUtil.dart';
import 'package:wordwave/components/utils/customUI.dart';
import 'package:wordwave/components/widgets/icon_btn.dart';
import 'package:wordwave/components/widgets/list_data.dart';
import 'package:wordwave/components/widgets/txt_form.dart';
import 'package:wordwave/service/jsonBloc/bloc/datas_bloc.dart';
import 'package:wordwave/service/jsonService/json_service.dart';
import '../core/model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> txtInput = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController inputController = TextEditingController();
  int score = 0;
  int health = 5;
  String gelenVeri = '';
  List<bool> inputValues = [];
  CustomUI customUI = CustomUI();

  @override
  void initState() {
    super.initState();
    txtInput = [];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeigth = MediaQuery.sizeOf(context).height;

    return RepositoryProvider<DatasService>(
      create: (context) => DatasService(),
      child: BlocProvider(
        create: (context) => DatasBloc(
          RepositoryProvider.of<DatasService>(context),
        )..add(
            LoadDatasEvent(),
          ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.25,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              appBar: const CustomAppBar(),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          '♥ $health',
                          style: GoogleFonts.comfortaa(
                            fontSize: 27,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Skor: $score',
                          style: GoogleFonts.comfortaa(
                            fontSize: 27,
                          ),
                        ),
                      ),
                      BlocBuilder<DatasBloc, DatasState>(
                        builder: (context, state) {
                          if (state is DatasLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is DatasLoadedState) {
                            List<Datas> newDatas = state.datas;
                            String randomTitle =
                                RepositoryProvider.of<DatasService>(context)
                                    .getRandomTitle(newDatas);

                            String randomNames =
                                RepositoryProvider.of<DatasService>(context)
                                    .getRandomName(newDatas, randomTitle);

                            final firstLetter = randomNames[0];
                            final lastLetter =
                                randomNames[randomNames.length - 1];
                            final unKnownText = '$firstLetter ... $lastLetter';

                            gelenVeri = randomNames;

                            return Column(
                              children: [
                                Text(
                                  randomTitle,
                                  style: GoogleFonts.balooDa2(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  unKnownText,
                                  style: GoogleFonts.balooDa2(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          }
                          return const Text('error');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListData(
                          childrenWidget: txtInput
                              .asMap()
                              .map(
                                (index, text) => MapEntry(
                                  index,
                                  Card(
                                    elevation: 5,
                                    color: inputValues[index]
                                        ? Colors.green
                                        : Colors.red,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: customListTile(txt: text),
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                          height: screenHeigth / 2.6,
                          width: screenWidth / 1.1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TxtFormWidget(txtController: inputController),
                          IconBtn(
                            isClicked: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  txtInput.add(inputController.text);
                                  inputValues.add(false);
                                });
                                if (inputController.text.toUpperCase() ==
                                    gelenVeri) {
                                  setState(() {
                                    score += 10;
                                    inputValues[txtInput.length - 1] = true;
                                  });
                                } else {
                                  setState(() {
                                    score -= 5;
                                    health -= 1;
                                    if (health <= 0) {
                                      setState(() {
                                        customUI.customShowDialog(
                                            context, score);
                                      });
                                    }

                                    inputValues[txtInput.length - 1] = false;
                                  });
                                }
                              }

                              inputController.clear();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
