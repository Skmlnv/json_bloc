import 'package:equatable/equatable.dart';
import 'package:expanded_cell/models/post_model.dart';
import 'package:flutter/material.dart';

abstract class PostState extends Equatable {}

class PostInitialState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

//ignore: must_be_immutable
class PostLoadedState extends PostState {
  List<Post> posts;

  PostLoadedState({@required this.posts});

  @override
  List<Object> get props => [posts];
}

//ignore: must_be_immutable
class PostErrorState extends PostState {
  String message;

  PostErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
