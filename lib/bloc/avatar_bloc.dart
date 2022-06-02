import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v_temi/avatarList/avatar_list.dart';
part 'avatar_event.dart';
part 'avatar_state.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  AvatarBloc() : super(AvatarInitial()) {
    on<ChangeAvatar>((event, emit) {
      int value = Random().nextInt(Avatar.avatars.length);
      final image = Avatar.avatars[value];
      emit(
        AvatarLoaded(
          url: image,
        ),
      );
    });
  }
}
