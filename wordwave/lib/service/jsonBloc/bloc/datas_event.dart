part of 'datas_bloc.dart';

abstract class DatasEvent extends Equatable {
  const DatasEvent();
}

class LoadDatasEvent extends DatasEvent {
  @override
  List<Object> get props => [];
}
