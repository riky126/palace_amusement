import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';
import 'dart:async';


// ViewModel
class HomeViewModel extends ViewModel with AsyncViewModelMixin {
  String name = "Ricky";
  HomeViewModel() {
    //registryProperty<String>(BindableProperty(name));
    propertyValue<String>(#name, initial: name);
  }

  void changeName() {
      setValue<String>(#name, "Ricardo");
  }

}