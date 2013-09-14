#!/bin/env dart

import 'dart:io';
import 'dart:uri';
import 'dart:json';

main() {

  for (int i = 1; i <= 1; i++) {
    var url = "https://api.github.com/legacy/repos/search/:java?language=java&start_page=${i}";
    print("Getting ${url}");
    new HttpClient().getUrl(Uri.parse(url)) .then((HttpClientRequest request) {
        // Prepare the request then call close on it to send it.
        return request.close();
    }, onError: (e) => print("ERROR ${e}"))
    .then((HttpClientResponse response) {
        // Process the response.
        print("Got repsponse ${response}.");
        StringBuffer buf = new StringBuffer();
        response.transform(new StringDecoder()).listen((d) { print("data IN"); buf.append(d); },
            onError: (e) => print("ERROR ${e}"), onDone: () {
                print("Got response ${buf.length} chars long.");
                var j = parse(buf);
                for (var item in j['repositories']) {
                    print(item['url']);
                }
            });
        new StringDecoder().bind(response).fold("", (a,b) { print("${a}..."); a + b; });
    }, onError: (e) => print("ERROR ${e}"));
    //.then((String s) {
    //    print("Got string ${s}");
    //    var j = parse(s);
    //    for (var item in j['repositories']) {
    //        print(item['url']);
    //    }
    //}, onError: (e) => print("ERROR ${e}"));
    
  }
  
}
