(function(){ 
  document.addEventListener("DOMContentLoaded", function (e) {

    var canvases = document.querySelectorAll('#bar_graph');
        // ctx = canvas.getContext('2d');
    var browser_els = document.querySelectorAll('.browser');

    // returns pseudo-array of tds with browser tally
    var id_rows = document.querySelectorAll('.count');

    var find_id = function(el){
     return el.id
    };

    // returns array of element ids
    var ids = Array.prototype.map.call(id_rows, find_id);

    var get_count = function(el){
      return parseInt(el.innerHTML); 
    };

    // function Browser(el){
    //     this.id = el.children[1].id;
    //     this.count = get_count(el.children[1]);
    // };

    var drawBarrowser = function(el){
        this.id = el.children[1].id;
        this.count = get_count(el.children[1]);
    };

    var browser_array = Array.prototype.slice.call(browser_els, 0);
    var browsers = browser_array.map(function(el){
        this.id = el.children[1].id;
        this.count = get_count(el.children[1]);
    });

    // returns array of browser tally
    var counts = Array.prototype.map.call(ids, get_count);

    var browser_total = counts.reduce(function(a,b){return a + b });

    // returns array of percentages 
    var stats = counts.map.call(counts, function(count){return ((count/browser_total)*100).toFixed(2)});

    // end helpers

    // here, want one argument passed in, which is the element object
    var drawBar = function(el){
      var y = ,
          x = 0,
          length = count * 30
          width = 20;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, width);
        ctx.fillStyle = 'black';
        ctx.fillText(percent + '%', length + 5, y + width/2 + 5);
        ctx.fill();
    }; 

   Array.prototype.forEach.call(canvases,drawBar);

  });
})();

(function(window){
 
  var barDrawer = function( element ){
    this.element = element;
    this.context = this.element.getContext( '2d' );

  };
 
  barDrawer.prototype.draw = function(){
    privateMethod();
  };
 
  //var pcd = new barDrawer( document.querySelector( "#canv1" ));
  //pcd.draw();
 
  window.barDrawer = barDrawer;
})(this);


 