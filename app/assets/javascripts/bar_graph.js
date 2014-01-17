(function(){ 
  document.addEventListener("DOMContentLoaded", function (e) {

    var canvas = document.getElementById('bar_graph'),
        ctx = canvas.getContext('2d');

    // start helpers
    var rows = document.querySelectorAll('.count');

    var find_id = function(el){
     return el.id
    };

    // returns array of ids
    var ids = Array.prototype.map.call(rows, find_id);

    var get_count = function(id){
      return parseInt(document.getElementById(id).innerHTML); 
    };

    // returns array of browser tally
    var counts = Array.prototype.map.call(ids, get_count);

    var browser_total = counts.reduce(function(a,b){return a + b });

    var stats = counts.map.call(counts, function(count){return ((count/browser_total)*100).toFixed(2)});

    // end helpers

    // this does the same thing as counts array
    var chrome = get_count('chrome'); 
    var firefox = get_count('firefox');
    var safari = get_count('safari');    
    var ie = get_count('ie');    
    var other = get_count('other'); 

    var chrome_percent = ((chrome/browser_total)*100).toFixed(2);
    var firefox_percent = ((firefox/browser_total)*100).toFixed(2);
    var safari_percent = ((safari/browser_total)*100).toFixed(2);
    var ie_percent = ((ie/browser_total)*100).toFixed(2);
    var other_percent = ((other/browser_total)*100).toFixed(2);


    var drawBar = function(count, color, yCoord, percent){
      var y = yCoord,
          x = 0,
          length = count * 30
          width = 20;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, width);
        ctx.fillStyle = 'black';
        ctx.fillText(percent + '%', length + 5, y + width/2 + 5);
        ctx.fill();
    }; 

    drawBar(chrome, 'black', 20, chrome_percent);
    drawBar(firefox, 'blue', 50, firefox_percent);
    drawBar(safari, 'red', 80, safari_percent);
    drawBar(ie, 'green', 110, ie_percent);
    drawBar(other, 'yellow', 140, other_percent);

    // ctx.fillStyle='black';    
    // ctx.fillText(chrome_percent+'%', 60, 20);

//     (function(window){
 
//   var PieChartDrawer = function( element ){
//     this.element = element;
//     this.context = this.element.getContext( '2d' );
//   };
 
//   PieChartDrawer.prototype.draw = function(){
//     privateMethod();
//   };
 
//   //var pcd = new PieChartDrawer( document.querySelector( "#canv1" ));
//   //pcd.draw();
 
//   window.PieChartDrawer = PieChartDrawer;
// })(this);


  });
})();