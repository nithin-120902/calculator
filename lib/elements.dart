class Elements{
  List<String> e=[];
  
  void push(String element){
    e.add(element);
  }
  
  String pop(int i){
    return e.removeAt(i);
  }

  bool isEmpty(){
    if(e.isEmpty){
      return true;
    }
    else{
      return false;
    }
  }
}