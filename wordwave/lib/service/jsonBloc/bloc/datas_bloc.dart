import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordwave/service/jsonService/json_service.dart';

import '../../../core/model/data_model.dart';

part 'datas_event.dart';
part 'datas_state.dart';

class DatasBloc extends Bloc<DatasEvent, DatasState> {
  final DatasService datasService;
  DatasBloc(this.datasService) : super(DatasLoadingState()) {
    on<DatasEvent>((event, emit) async {
      emit(DatasLoadingState());

      try {
        final datas = await datasService.allData();

        if (datas.isNotEmpty) {
          emit(DatasLoadedState(datas));
        } else {
          emit(DatasErrorState('ERROR'));
        }
      } catch (err) {
        debugPrint('HATA: $err');
      }
    });
  }
}
