$(document).ready(function(){


$(".readMore").click(function(){
var This=$(this);    
$(this).next().toggle(function(){
    if(This.text()=="Hide"){
      This.text("Read")
    }
    else{
        This.text("Hide")
    }
})
});});
