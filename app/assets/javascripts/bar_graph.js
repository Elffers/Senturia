(function(){ 
  document.addEventListener("DOMContentLoaded", function (e) {

    var canvas = document.getElementById('bar_graph'),
        ctx = canvas.getContext('2d');

    // var rows = document.querySelectorAll('.count');

    // var find_id = function(el){
    //  return el.id
    // };

    // var ids = Array.prototype.map.call(rows, find_id);

    // var get_count = function(id){
    //   return parseInt(document.getElementById(id).innerHTML); 
    // };

    // var counts = Array.prototype.map.call(ids, get_count);

    var chrome = parseInt(document.getElementById('chrome').innerHTML); 
    var firefox = parseInt(document.getElementById('firefox').innerHTML);
    var safari = parseInt(document.getElementById('safari').innerHTML);    
    var ie = parseInt(document.getElementById('ie').innerHTML);    
    var other = parseInt(document.getElementById('other').innerHTML);    

    var drawBar = function(count, color, yCoord){
      var y = yCoord,
          x = 0,
          length = count * 30;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, 20);
    }; 

    drawBar(chrome, 'black', 20);
    drawBar(firefox, 'blue', 50);
    drawBar(safari, 'red', 80);
    drawBar(ie, 'green', 110);
    drawBar(other, 'yellow', 140);

    


  });
})();