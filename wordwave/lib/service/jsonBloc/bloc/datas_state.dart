// ignore_for_file: must_be_immutable

part of 'datas_bloc.dart';

abstract class DatasState extends Equatable {
  const DatasState();
}

class DatasLoadingState extends DatasState {
  @override
  List<Object> get props => [];
}

class DatasLoadedState extends DatasState {
  DatasLoadedState(this.datas);
  List<Datas> datas;
  @override
  List<Object> get props => [datas];
}

class DatasErrorState extends DatasState {
  DatasErrorState(this.error);
  String error;
  @override
  List<Object> get props => [error];
}
