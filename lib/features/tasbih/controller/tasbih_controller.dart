import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/tasbih/model/tasbih.dart';

class TasbihController extends GetxController{
  final dorpDownController = TextEditingController();
  List<String> item = ["Loading..."];
  double maximum=30;
  double value=0;
  List<Tasbih?>? tasbih;
  String selectedEnTasbih='';
  String selectedPronunciation='';
  bool isLoading=false;

  onUpdateData(val,var selectedTasbihData){
    selectedEnTasbih = val;
    selectedPronunciation = selectedTasbihData.pronunciation;
    update();
  }

  Future<void> readTasbih() async {
    try{
      tasbih = await ApiRequestController().getTasbih();
      if (tasbih != null && tasbih!.isNotEmpty) {
        item = tasbih!.map((e) => e!.text!.ar.toString()).toList();
      }else {
        item = ["No Data Available"]; // Friendly message
      }
    }catch(e){
      item= ["Failed to Load"];// Handle API errors
    }finally {
      isLoading = false;
    }
    update();// Notify UI to update
  }

  add(){
    maximum++;
    update();
  }
  sub(){
    maximum--;
    update();
  }
  addValue(){
   if(value<maximum){
     value++;
   }
    update();
  }
  reset(){
    value=0;
    update();
  }
  @override
  void onInit() {
    readTasbih();
    super.onInit();
  }
}