(function(){ 
  document.addEventListener("DOMContentLoaded", function (e) {

    var canvas = document.getElementById('bar_graph'),
        ctx = canvas.getContext('2d');

// iterative method
    var rows = document.querySelectorAll('.count');

    var find_id = function(el){
     return el.id
    };

    var ids = Array.prototype.map.call(rows, find_id);

    var get_count = function(id){
      return parseInt(document.getElementById(id).innerHTML); 
    };

    var counts = Array.prototype.map.call(ids, get_count);

    var browser_total = counts.reduce(function(a,b){return a + b });

    var stats = counts.map.call(counts, function(count){return ((count/browser_total)*100).toFixed(2)});
    
// end iteration

    var chrome = parseInt(document.getElementById('chrome').innerHTML); 
    var firefox = parseInt(document.getElementById('firefox').innerHTML);
    var safari = parseInt(document.getElementById('safari').innerHTML);    
    var ie = parseInt(document.getElementById('ie').innerHTML);    
    var other = parseInt(document.getElementById('other').innerHTML); 

    var chrome_percent = ((chrome/browser_total)*100).toFixed(2);


    var drawBar = function(count, color, yCoord){
      var y = yCoord,
          x = 0,
          length = count * 30
          width = 20;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, width);
        // var percent = browser/browser_total;
        ctx.fillStyle = 'black';
        // ctx.fillText(percent + '%', length + 5, y + width/2 + 5);
        // ctx.fill();
    }; 

    drawBar(chrome, 'black', 20);
    drawBar(firefox, 'blue', 50);
    drawBar(safari, 'red', 80);
    drawBar(ie, 'green', 110);
    drawBar(other, 'yellow', 140);

    // ctx.fillStyle='black';    
    // ctx.fillText(chrome_percent+'%', 60, 20);

    (function(window){
 
  var barDrawer = function( element ){
    this.element = element;
    this.context = this.element.getContext( '2d' );
  };
 
  barDrawer.prototype.draw = function(){
    privateMethod();
  };
 
  //var pcd = new PieChartDrawer( document.querySelector( "#canv1" ));
  //pcd.draw();
 
  window.PieChartDrawer = PieChartDrawer;
})(this);


  });
})();