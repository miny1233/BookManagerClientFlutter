//
//  Generated code. Do not modify.
//  source: test.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class empty extends $pb.GeneratedMessage {
  factory empty({
    $core.String? none,
  }) {
    final $result = create();
    if (none != null) {
      $result.none = none;
    }
    return $result;
  }
  empty._() : super();
  factory empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'empty', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'none')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  empty clone() => empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  empty copyWith(void Function(empty) updates) => super.copyWith((message) => updates(message as empty)) as empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static empty create() => empty._();
  empty createEmptyInstance() => create();
  static $pb.PbList<empty> createRepeated() => $pb.PbList<empty>();
  @$core.pragma('dart2js:noInline')
  static empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<empty>(create);
  static empty? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get none => $_getSZ(0);
  @$pb.TagNumber(1)
  set none($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNone() => $_has(0);
  @$pb.TagNumber(1)
  void clearNone() => clearField(1);
}

class BookInfo extends $pb.GeneratedMessage {
  factory BookInfo({
    $fixnum.Int64? bookId,
    $core.String? title,
    $core.String? description,
    $core.String? author,
    $core.String? price,
    $core.List<$core.int>? image,
    $core.String? bookName,
  }) {
    final $result = create();
    if (bookId != null) {
      $result.bookId = bookId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (author != null) {
      $result.author = author;
    }
    if (price != null) {
      $result.price = price;
    }
    if (image != null) {
      $result.image = image;
    }
    if (bookName != null) {
      $result.bookName = bookName;
    }
    return $result;
  }
  BookInfo._() : super();
  factory BookInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BookInfo', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'bookId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'author')
    ..aOS(5, _omitFieldNames ? '' : 'price')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'bookName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookInfo clone() => BookInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookInfo copyWith(void Function(BookInfo) updates) => super.copyWith((message) => updates(message as BookInfo)) as BookInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BookInfo create() => BookInfo._();
  BookInfo createEmptyInstance() => create();
  static $pb.PbList<BookInfo> createRepeated() => $pb.PbList<BookInfo>();
  @$core.pragma('dart2js:noInline')
  static BookInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookInfo>(create);
  static BookInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bookId => $_getI64(0);
  @$pb.TagNumber(1)
  set bookId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBookId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBookId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get author => $_getSZ(3);
  @$pb.TagNumber(4)
  set author($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthor() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get price => $_getSZ(4);
  @$pb.TagNumber(5)
  set price($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get image => $_getN(5);
  @$pb.TagNumber(6)
  set image($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearImage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get bookName => $_getSZ(6);
  @$pb.TagNumber(7)
  set bookName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBookName() => $_has(6);
  @$pb.TagNumber(7)
  void clearBookName() => clearField(7);
}

class AllBookInfo extends $pb.GeneratedMessage {
  factory AllBookInfo({
    $core.Iterable<BookInfo>? bookList,
  }) {
    final $result = create();
    if (bookList != null) {
      $result.bookList.addAll(bookList);
    }
    return $result;
  }
  AllBookInfo._() : super();
  factory AllBookInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AllBookInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AllBookInfo', createEmptyInstance: create)
    ..pc<BookInfo>(1, _omitFieldNames ? '' : 'bookList', $pb.PbFieldType.PM, protoName: 'bookList', subBuilder: BookInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AllBookInfo clone() => AllBookInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AllBookInfo copyWith(void Function(AllBookInfo) updates) => super.copyWith((message) => updates(message as AllBookInfo)) as AllBookInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllBookInfo create() => AllBookInfo._();
  AllBookInfo createEmptyInstance() => create();
  static $pb.PbList<AllBookInfo> createRepeated() => $pb.PbList<AllBookInfo>();
  @$core.pragma('dart2js:noInline')
  static AllBookInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AllBookInfo>(create);
  static AllBookInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BookInfo> get bookList => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
