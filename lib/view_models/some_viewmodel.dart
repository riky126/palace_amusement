import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';
import 'dart:async';


// ViewModel
class PageViewModel extends ViewModel with AsyncViewModelMixin {
  int count = 0;
  PageViewModel() {
      propertyValue<int>(#count, initial: count);
  }


  void increment() {
    count++;
    setValue<int>(#count, count);
  }

}