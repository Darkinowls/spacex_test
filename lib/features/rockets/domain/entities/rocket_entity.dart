import 'package:equatable/equatable.dart';

class RocketEntity extends Equatable {
  final String rocketId;
  final String imageRef; //https://imgur.com/DaCfMsj.jpg

  const RocketEntity({
    required this.rocketId,
    required this.imageRef,
  });


  @override
  List<Object> get props => [rocketId, imageRef];
}