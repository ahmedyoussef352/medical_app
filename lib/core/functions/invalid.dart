validInput(val , min ,max){
  if(val.length> max){
    var messageInputMax=' can\'t be larger than $max';
    return messageInputMax;
  }
    if(val.isEmpty){
    var messageInputEmpty = 'can\'t be Empty';
    return messageInputEmpty;

  }
  if(val.length < min){
    var messageInputMin='can\'t be less than $min';
    return messageInputMin ;
  }

}
