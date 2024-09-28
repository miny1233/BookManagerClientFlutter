//
//  Generated code. Do not modify.
//  source: test.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'test.pb.dart' as $0;

export 'test.pb.dart';

@$pb.GrpcServiceName('BookService')
class BookServiceClient extends $grpc.Client {
  static final _$getAllBook = $grpc.ClientMethod<$0.empty, $0.AllBookInfo>(
      '/BookService/GetAllBook',
      ($0.empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AllBookInfo.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AllBookInfo> getAllBook($0.empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllBook, request, options: options);
  }
}

@$pb.GrpcServiceName('BookService')
abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.empty, $0.AllBookInfo>(
        'GetAllBook',
        getAllBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.empty.fromBuffer(value),
        ($0.AllBookInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.AllBookInfo> getAllBook_Pre($grpc.ServiceCall call, $async.Future<$0.empty> request) async {
    return getAllBook(call, await request);
  }

  $async.Future<$0.AllBookInfo> getAllBook($grpc.ServiceCall call, $0.empty request);
}
