var amount_of_form_fields = 0 // count amount of formfields
function createNewInput(){
    amount_of_form_fields = numberOfFormFields() + 1;
    createMediaDiv();
}

function numberOfFormFields(){
   return document.getElementsByTagName('iframe').length;
}

function createMediaDiv(){
    var mediaElement = document.createElement("div");
    mediaElement.id = "mediaForm" + amount_of_form_fields;
    mediaElement.innerHTML =
        "<iframe id='"+mediaElement.id +"Iframe' src='#'>No available content</iframe>"+
        "<br/><input type='text' id='field" +
        amount_of_form_fields + "' name='field" + amount_of_form_fields + "' value=''>"+
        "<a href='#1' onClick='previewInput("+ amount_of_form_fields +")'>preview</a>" +
        "<br/><textarea id='description" + amount_of_form_fields +
        "' name='description" + amount_of_form_fields + "' value=''></textarea>";
    var prevElement = document.getElementById("create_input_link_id");
    prevElement.parentNode.insertBefore(mediaElement, prevElement);
}

function previewInput(fieldNum){
    var elementId = "mediaForm"+ fieldNum;
    var element = document.getElementById('field' + fieldNum);
    var iframeSrc = element.value;
    if(document.getElementById(elementId +"Iframe") == null){
        var newIframe = document.createElement("iframe");
        newIframe.src = iframeSrc;
        newIframe.id  = elementId +"Iframe";
        var elementBefore = document.getElementById("mediaForm" + fieldNum);
        elementBefore.parentNode.insertBefore(newIframe, elementBefore);
    }
    document.getElementById(elementId +"Iframe").src = iframeSrc;
}
