// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostDataAdapter extends TypeAdapter<PostData> {
  @override
  final int typeId = 1;

  @override
  PostData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostData(
      id: fields[0] as String,
      caption: fields[1] as String,
      imageUrl: fields[2] as String,
      user: fields[3] as String,
      likes: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PostData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.caption)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.user)
      ..writeByte(4)
      ..write(obj.likes)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
