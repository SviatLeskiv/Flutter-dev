
part of 'avatar_bloc.dart';


abstract class AvatarState extends Equatable {
  const AvatarState();
  
  @override
  List<Object> get props => [];
}

class AvatarInitial extends AvatarState {}

class AvatarLoaded extends AvatarState {

  final String url;
 
  const AvatarLoaded({required this.url});

  @override
  List<Object> get props => [url];
}
