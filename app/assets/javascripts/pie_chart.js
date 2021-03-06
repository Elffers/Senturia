(function(){ 
    document.addEventListener("DOMContentLoaded", function (e) {

        var canvas = document.getElementById('pie_chart'),
        ctx = canvas.getContext('2d'),
        y = canvas.height/2,
        x = canvas.width/2,
        radius = canvas.height/2 - 25,
        totalVisitsEl = document.getElementById('total_visits').innerHTML,
        uniqVisitsEl = document.getElementById('unique_visits').innerHTML,
        totalVisits = parseInt(totalVisitsEl, 10),
        uniqVisits = parseInt(uniqVisitsEl, 10),
        uniqVisitsDeg = (uniqVisits/totalVisits) * (2*Math.PI),
        uvPercent= (uniqVisits/totalVisits*100).toFixed(2),
        totPercent= ((1 - uniqVisits/totalVisits)*100).toFixed(2),
        totVisitsDeg = 2*Math.PI * (1-(uniqVisits/totalVisits));
        
        var rad2Cart = function(radiusLength, radians){
            var coords = {};
            coords.x = (radiusLength/2)* Math.cos(radians/2);
            coords.y = (radiusLength/2)* Math.sin(radians/2);
            return coords;
        };

        var uvpCoords = rad2Cart(radius,uniqVisitsDeg),
            uvPercX = uvpCoords.x,
            uvPercY = uvpCoords.y;
        
        var totCoords = rad2Cart(radius,totVisitsDeg),
            totPercX = totCoords.x,
            totPercY = totCoords.y;

        // var uvPercX= (radius/2)*Math.cos(uniqVisitsDeg/2),
        // uvPercY=(radius/2)*Math.sin(uniqVisitsDeg/2),
        // totPercX=(radius/2)*Math.cos(totVisitsDeg/2),
        // totPercY=(radius/2)*Math.sin(totVisitsDeg/2);

        ctx.fillStyle = '#8A0808' ; 
        ctx.beginPath();
        ctx.arc(x,y, radius, 0, uniqVisitsDeg, false);
        ctx.lineTo(x,y);
        ctx.closePath();
        ctx.fillRect(10, 10, 15, 15);
        ctx.fill();
        ctx.fillStyle = 'black';
        ctx.fillText("Unique", 30, 20);

        ctx.fillStyle = '#D8AC3C' ; 
        ctx.beginPath();
        ctx.arc(x,y, radius, 0, uniqVisitsDeg, true);
        ctx.lineTo(x,y);
        ctx.closePath();
        ctx.fillRect(10,30,15,15);
        ctx.fill();
        ctx.fillStyle = 'black';
        ctx.fillText("Total", 30, 40);

        ctx.font = '12pt Helvetica';
        ctx.fillStyle = 'white';
        if(uniqVisitsDeg < Math.PI/10 ){
            ctx.fillText( uvPercent + '%', canvas.width-50, canvas.height/2+15);
        } else {
            ctx.fillText( uvPercent + '%', x + uvPercX, y+ uvPercY+10);
        };
        ctx.fillText( totPercent + '%', x + totPercX, y - totPercY -10 );

  });
}());