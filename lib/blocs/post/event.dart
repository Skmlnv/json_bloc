import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class FetchPostEvent extends PostEvent {
  @override
  List<Object> get props => null;
}
