(function(){ 
  document.addEventListener("DOMContentLoaded", function (e) {

    var browser_els = document.querySelectorAll('.browser');

    // returns array of browser tally
    var rows = document.querySelectorAll('.count');

    var find_id = function(el){
     return el.id
    };

    // returns array of ids
    var ids = Array.prototype.map.call(rows, find_id);

    var get_count = function(id){
      return parseInt(document.getElementById(id).innerHTML); 
    };

    var counts = Array.prototype.map.call(ids, get_count);

    var browser_total = counts.reduce(function(a,b){return a + b });
    
    // end helpers

    var Browser = function(el){
        this.id = el.children[1].id;
        this.count = parseInt(el.children[1].innerHTML);
        this.canvas = el.querySelector('#bar_graph');
        this.ctx = this.canvas.getContext('2d');
        this.percent = ((this.count/browser_total)*100).toFixed(2);
    };

    var browser_array = Array.prototype.slice.call(browser_els, 0);
    // var browsers = browser_array.forEach.call(new Browser);

    var a = new Browser(browser_array[0]);
    var b = new Browser(browser_array[1]);
    var c = new Browser(browser_array[2]);
    var d = new Browser(browser_array[3]);
    var e = new Browser(browser_array[4]);

    var drawBar = function(el, color){
      var y = 0,
          x = 0,
          length = el.count * 30
          width = 20
          ctx = el.ctx;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, width);
        ctx.fillStyle = 'black';
        ctx.fillText(el.percent + '%', length + 5, y + width/2 + 5);
        ctx.fill();
    }; 

    drawBar(a, '#173B0B');
    drawBar(b, '#8A0808');
    drawBar(c, '#0B2161');
    drawBar(d, '#045FB4');
    drawBar(e, '#088A08');

   // Array.prototype.forEach.call(canvases,drawBar);

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


 