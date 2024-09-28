//
//  Generated code. Do not modify.
//  source: test.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const empty$json = {
  '1': 'empty',
  '2': [
    {'1': 'none', '3': 1, '4': 1, '5': 9, '10': 'none'},
  ],
};

/// Descriptor for `empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVlbXB0eRISCgRub25lGAEgASgJUgRub25l');

@$core.Deprecated('Use bookInfoDescriptor instead')
const BookInfo$json = {
  '1': 'BookInfo',
  '2': [
    {'1': 'book_id', '3': 1, '4': 1, '5': 3, '10': 'bookId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'author', '3': 4, '4': 1, '5': 9, '10': 'author'},
    {'1': 'price', '3': 5, '4': 1, '5': 9, '10': 'price'},
    {'1': 'image', '3': 6, '4': 1, '5': 12, '10': 'image'},
    {'1': 'book_name', '3': 7, '4': 1, '5': 9, '10': 'bookName'},
  ],
};

/// Descriptor for `BookInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookInfoDescriptor = $convert.base64Decode(
    'CghCb29rSW5mbxIXCgdib29rX2lkGAEgASgDUgZib29rSWQSFAoFdGl0bGUYAiABKAlSBXRpdG'
    'xlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIWCgZhdXRob3IYBCABKAlSBmF1'
    'dGhvchIUCgVwcmljZRgFIAEoCVIFcHJpY2USFAoFaW1hZ2UYBiABKAxSBWltYWdlEhsKCWJvb2'
    'tfbmFtZRgHIAEoCVIIYm9va05hbWU=');

@$core.Deprecated('Use allBookInfoDescriptor instead')
const AllBookInfo$json = {
  '1': 'AllBookInfo',
  '2': [
    {'1': 'bookList', '3': 1, '4': 3, '5': 11, '6': '.BookInfo', '10': 'bookList'},
  ],
};

/// Descriptor for `AllBookInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allBookInfoDescriptor = $convert.base64Decode(
    'CgtBbGxCb29rSW5mbxIlCghib29rTGlzdBgBIAMoCzIJLkJvb2tJbmZvUghib29rTGlzdA==');

