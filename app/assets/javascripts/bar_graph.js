(function(window){
  "use strict";
  var document = window.document;
  document.addEventListener("DOMContentLoaded", function (e) {

    var browser_els = document.querySelectorAll('.browser');

    // returns array of browser tally
    var rows = document.querySelectorAll('.count');

    var find_id = function(el){
     return el.id;
    };

    // returns array of ids
    var ids = Array.prototype.map.call(rows, find_id);

    var get_count = function(id){
      return parseInt(document.getElementById(id).innerHTML, 10);
    };

    var counts = Array.prototype.map.call(ids, get_count);

    var browser_total = counts.reduce(function(a,b){return a + b; });

    // end helpers

    var Browser = function(el){
        this.id = el.children[1].id;
        this.count = parseInt(el.children[1].innerHTML, 10);
        this.canvas = el.querySelector('#bar_graph');
        this.ctx = this.canvas.getContext('2d');
        this.percent = ((this.count/browser_total)*100).toFixed(2);
    };

    Browser.prototype.drawBar = function(color){
      var y = 0,
          x = 0,
          length = (this.percent/100) * 200,
          width = 20,
          ctx = this.ctx;
        ctx.fillStyle = color;
        ctx.fillRect(x, y, length, width);
        ctx.fillStyle = 'black';
        ctx.fillText(this.percent + '%', length + 5, y + width/2 + 5);
        ctx.fill();
    };

    var colors = ['#173B0B', '#8A0808', '#0B2161', '#045FB4', '#088A08'];
    Array.prototype.forEach.call( browser_els, function( el, idx ){
      var a = new Browser(el);
      a.drawBar(colors[idx]);
    });

  });
})(this);

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
