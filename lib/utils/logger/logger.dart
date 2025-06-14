import 'dart:developer';

void logI(Object message) => log(message.toString(), name: 'INFO');

void logW(Object message) => log(message.toString(), name: 'WARNING');

void logE(Object message) => log(message.toString(), name: 'ERROR');
