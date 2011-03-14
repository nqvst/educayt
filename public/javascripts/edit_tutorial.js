$(document).ready(hideImpossibleActions);

function moveLi(id, direction){
    var object = document.getElementById(id);
    var position = 0;
    var parent = object.parentNode;
    var syblings = parent.getElementsByTagName('li');
    var listLength = syblings.length;
    
    for(var i = 0 ; i < syblings.length ; i++){
       if(syblings[i].id == object.id){
           position = i;
       }
    }
    
    if(direction == 'up' && position != 0){
        parent.removeChild(object)
        parent.insertBefore(object, parent.getElementsByTagName('li')[position - 1])
    }
    if(direction == 'down' && position != listLength - 1){
        parent.removeChild(object)
        parent.insertBefore(object, parent.getElementsByTagName('li')[position + 1])
    }

    hideImpossibleActions();
    var newPositions = parent.getElementsByTagName('li');
    var newOrder = '';
    for(i = 0; i < newPositions.length ; i ++){
        newOrder += newPositions[i].id.replace('part_', '') + ',';
    }
    document.getElementById('tutorial_parts_order').value = newOrder;
}

function hideImpossibleActions(){
    var moveUpElements = document.getElementsByName('move_up');
    moveUpElements[0].style.visibility = 'hidden';
    for(i = 1; i < moveUpElements.length; i++ ){
        moveUpElements[i].style.visibility = 'visible';
    }

    var moveDownElements = document.getElementsByName('move_down');
    length = moveDownElements.length - 1;
    moveDownElements[length].style.visibility = 'hidden';
    for(i = 0; i < moveDownElements.length-1; i++ ){
        moveDownElements[i].style.visibility = 'visible';
    }
}