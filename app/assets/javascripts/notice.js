$(document).ready(function(){
    $(".readMore").click(function(){
        var instance = $(this);

        instance.next().toggle( function() {
            if(instance.text() == "Hide"){
                instance.text("Read")
            }
            else{
                instance.text("Hide")
            }
        })
    });
});
