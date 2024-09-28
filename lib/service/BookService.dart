
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:mysql_client/mysql_protocol.dart';

import '../protobuf/test.pbgrpc.dart';

class OrderInfo {

  OrderInfo({
    required this.orderID,
    required this.status,
    required this.bookName,
    required this.orderDatatime,
    required this.shoppingAddress,
  });

  int orderID;
  String status;
  String bookName;
  String orderDatatime;
  String shoppingAddress;
}

class BookService extends GetxService
{
  late BookServiceClient stub;
  late MySQLConnection conn;

  int userid = 0;

  Future<void> _mysql_init () async {
    conn = await MySQLConnection.createConnection(
      host: "121.36.201.254",
      port: 3306,
      userName: "root",
      password: "w+uf2,hm9n%E",
      databaseName: "app_database", // optional
    );

    await conn.connect();
  }

  @override
  void onInit() {
    super.onInit();
    final channel = ClientChannel(
      '121.36.201.254',
      port: 5001,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        //codecRegistry: //CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );

    stub = BookServiceClient(channel);

    //mysql
    _mysql_init();
  }


  Future<List<BookInfo>> GetAllBook() async
  {
    print('request all book');
    final responce = await stub.getAllBook(empty());
    return responce.bookList;
  }

  Future<bool> buyBook(int bookid,String address)
  async {
    var res = await conn.execute(
      'INSERT INTO Orders (user_id, book_id, order_datetime, status, shopping_address) VALUES (:user_id, :book_id, :order_datetime, :status, :shopping_address)',
      {
        'user_id':userid,
        'book_id':bookid,
        'order_datetime': DateTime.now(),
        'status': '待发货',
        'shopping_address': address,
      },
    );

    return res.affectedRows > BigInt.zero;
  }

  Future<List<OrderInfo>> getOrder() async {
    print('request all order');

    var res = await conn.execute(
        'SELECT order_id,status,book_name,order_datetime,shopping_address FROM Orders o '
            'JOIN Users u ON o.user_id = u.user_id '
            'JOIN Books b ON o.book_id = b.book_id WHERE o.user_id = $userid '
            'GROUP BY o.order_id, u.username, b.book_name, o.order_datetime, o.status, o.shopping_address '
            'ORDER BY o.status DESC;'
    );
    var ret = <OrderInfo>[];
    for(final row in res.rows){
      ret.add(OrderInfo(orderID: int.parse(row.colAt(0) ?? 'null'), status: row.colAt(1) ?? 'null', bookName: row.colAt(2) ?? 'null', orderDatatime: row.colAt(3) ?? 'null', shoppingAddress: row.colAt(4) ?? 'null'));
    }

    return ret;
  }

  Future<bool> cancelOrder(int orderID) async {

    final res = await conn.execute('DELETE FROM Orders WHERE order_id = $orderID AND status = \'待发货\' ');

    return res.affectedRows > BigInt.zero;
  }

  Future<bool> confirmOrder(int orderID) async {
    final res = await conn.execute('UPDATE Orders SET status = \'已签收\' WHERE order_id = $orderID AND status = \'待签收\' ');

    return res.affectedRows > BigInt.zero;
  }

  Future<bool> login(String username,String password) async {
    final res = await conn.execute('SELECT * FROM Users WHERE username = \'$username\' AND password = \'$password\'');

    userid = int.parse(res.rows.first.assoc()['user_id'] ?? '0');

    return userid != 0;
  }
  
  Future<bool> register(String username,String password) async {
    final res = await conn.execute('insert into Users (username,password) value (:username,:password)',
      {
        'username':username,
        'password':password
      }
    );

    return res.affectedRows > BigInt.zero;
  }
}