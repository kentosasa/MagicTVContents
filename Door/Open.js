var data = "tuple={\"where\":\"delta\",\"type\":\"door\", \"cmd\":\"open\"}";
var xmlHttpRequest = new XMLHttpRequest();
xmlHttpRequest.open( 'POST', 'http://linda-server.herokuapp.com/masuilab' );
// サーバに対して解析方法を指定する
xmlHttpRequest.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
// データをリクエスト ボディに含めて送信する
xmlHttpRequest.send(data);
