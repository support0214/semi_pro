$(function (){
    const x = $(".slide>div");
    setInterval(function () {
        if (x.position().left == -2000) {
            x.animate({ left: "-=1000px" }, function () {
                x.css("left", 0);
            })
        } else {
            x.animate({ left: "-=1000px" });
        }
    }, 3000)
})