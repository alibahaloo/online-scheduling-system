/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  ALTTXT V1.2
//  BY: BRIAN GOSSELIN OF SCRIPTASYLUM.COM
//  ADDED FADING EFFECT FOR IE4+ AND NS6+ ONLY AND OPTIMIZED THE CODE A BIT.
//  SCRIPT FEATURED ON DYNAMIC DRIVE (http://www.dynamicdrive.com)
//  Modifed by DD for doctype bug on Nov 13th, 2003


var dofade=true;     // ENABLES FADE-IN EFFECT FOR IE4+ AND NS6 ONLY
var center=false;     // CENTERS THE BOX UNER THE MOUSE, OTHERWISE DISPLAYS BOX TO THE RIGHT OF THE MOUSE
var centertext=false; // CENTERS THE TEXT INSIDE THE BOX. YOU CAN'T SIMPLY DO THIS VIA STYLE BECAUSE OF NS4.
                     // OTHERWISE, TEXT IS LEFT-JUSTIFIED. 


////////////////////////////// NO NEED TO EDIT BEYOND THIS POINT //////////////////////////////////////

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

var NS4 = (navigator.appName.indexOf("Netscape")>=0 && !document.getElementById)? true : false;
var IE4 = (document.all && !document.getElementById)? true : false;
var IE5 = (document.getElementById && document.all)? true : false;
var NS6 = (document.getElementById && navigator.appName.indexOf("Netscape")>=0 )? true: false;
var W3C = (document.getElementById)? true : false;
var w_y, w_x, navtxt, outerpair1, outerpair2, shadowbox, boxheight, boxwidth, boxleft, boxtop, test;
var ishover=false;
var isloaded=false;
var allowmove=true;
var ieop=0;
var op_id=0;

function getwindowdims(){
w_y=(NS4||NS6||window.opera)? window.innerHeight : (IE5||IE4)? document.documentElement.clientHeight : 0;
w_x=(NS4||NS6||window.opera)? window.innerWidth : (IE5||IE4)? document.documentElement.clientWidth : 0;
}

function getboxwidth(){
if(NS4)boxwidth=(outerpair1.document.width)? outerpair1.document.width : outerpair1.clip.width;
if(IE5||IE4)boxwidth=(outerpair1.style.pixelWidth)? outerpair1.style.pixelWidth : outerpair1.offsetWidth;
if(NS6)boxwidth=(outerpair1.style.width)? parseInt(outerpair1.style.width) : parseInt(outerpair1.offsetWidth);
}

function getboxheight(){
if(NS4)boxheight=(outerpair1.document.height)? outerpair1.document.height : outerpair1.clip.height;
if(IE4||IE5)boxheight=(outerpair1.style.pixelHeight)? outerpair1.style.pixelHeight : outerpair1.offsetHeight;
if(NS6)boxheight=parseInt(outerpair1.offsetHeight);

}

function findPosX(obj)
  {
    var curleft = 0;
    if(obj.offsetParent)
        while(1) 
        {
          curleft += obj.offsetLeft;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.x)
        curleft += obj.x;
    return curleft;
  }

function findPosY(obj)
  {
    var curtop = 0;
    if(obj.offsetParent)
        while(1)
        {
          curtop += obj.offsetTop;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.y)
        curtop += obj.y;
    return curtop;
  }


function movenavtxt(x,y){
if(NS4)outerpair1.moveTo(x,y);
if(W3C||IE4){
outerpair1.style.left=x+'px';
outerpair1.style.top=y+'px';
}}

function getpagescrolly(){
if(NS4||NS6)return window.pageYOffset;
if(IE5||IE4)return ietruebody().scrollTop;
}

function getpagescrollx(){
if(NS4||NS6)return window.pageXOffset;
if(IE5||IE4)return ietruebody().scrollLeft;
}

function writeindiv(text){
if(NS4){
navtxt.document.open();
navtxt.document.write(text);
navtxt.document.close();
}
if(W3C||IE4)navtxt.innerHTML=text;
}

//**** END UTILITY FUNCTIONS ****//

function writetxt(text, cell){
if(isloaded){
if(text!=0){
ishover=true;
if(NS4)text='<div class="navtext">'+((centertext)?'<center>':'')+text+((centertext)?'</center>':'')+'</div>';
writeindiv(text);
getboxheight();
boxleft=findPosX(cell) + 5;
boxtop=findPosY(cell) + 5;

if((W3C || IE4) && dofade){
ieop=0;
//incropacity();
}}else{

if(!((boxleft <= mx && mx <= boxleft + boxwidth) && (boxtop <= my && my <= boxtop + boxheight))) {
//alert(boxtop + ' ' + my + ' ' + boxheight);
if(NS4)outerpair1.visibility="hide";
if(IE4||W3C){
if(dofade)clearTimeout(op_id);
outerpair1.style.visibility="hidden";
writeindiv(''); 
    }
}
}}}

function incropacity(){
if(ieop<=100){
ieop+=7;
if(IE4 || IE5)outerpair1.style.filter="alpha(opacity="+ieop+")";
if(NS6)outerpair1.style.MozOpacity=ieop/100;
op_id=setTimeout('incropacity()', 50);
}}

function moveobj(evt){

if (NS4){
mx=evt.pageX
my=evt.pageY
}
else if (NS6){
mx=evt.clientX
my=evt.clientY
}
else if (IE5){
mx=event.clientX
my=event.clientY
}
else if (IE4){
mx=0
my=0
}

if(NS4){
mx-=getpagescrollx();
my-=getpagescrolly();
}

my = my+getpagescrolly();

if(isloaded && ishover){
ishover=false;
margin=(IE4||IE5)? 1 : 23;
if(NS6)if(document.height+27-window.innerHeight<0)margin=15;
if(NS4)if(document.height-window.innerHeight<0)margin=10;
//mx=(NS4||NS6)? evt.pageX : (IE5||IE4)? event.clientX : 0;
//my=(NS4||NS6)? evt.pageY : (IE5||IE4)? event.clientY : 0;

//start box under mouse
xoff=(center)? mx-boxwidth/2 : mx-20;
yoff=(my+boxheight+30-getpagescrolly()+margin>=w_y)? 20-boxheight: -20;
boxleft = Math.min(Math.min(w_x-boxwidth-margin , Math.max(2,xoff))+getpagescrollx(), boxleft);
//boxtop = Math.max(my+yoff+getpagescrolly(), boxtop);

//alert(boxtop);
movenavtxt(boxleft,boxtop);
if(NS4)outerpair1.visibility="show";
if(W3C||IE4)outerpair1.style.visibility="visible";

}
//else if(navtxt.innerHTML=="") {
//if(NS4)outerpair1.visibility="hide";
//if(IE4||W3C){
//if(dofade)clearTimeout(op_id);
//outerpair1.style.visibility="hidden";
//}

writetxt(0); //every mouse move check to see if we left box
}

if(NS4)document.captureEvents(Event.MOUSEMOVE);
document.onmousemove=moveobj;
window.onload=function(){
  navtxt=(NS4)? document.layers['navtxt'] : (IE4)? document.all['navtxt'] : (W3C)? document.getElementById('navtxt') : null;
  outerpair1=(NS4)? document.layers['outerpair1'] : (IE4)? document.all['outerpair1'] : (W3C)? document.getElementById('outerpair1') : null;
  outerpair2=(NS4)? document.layers['outerpair2'] : (IE4)? document.all['outerpair2'] : (W3C)? document.getElementById('outerpair2') : null;
  shadowbox=(NS4)? document.layers['shadowbox'] : (IE4)? document.all['shadowbox'] : (W3C)? document.getElementById('shadowbox') : null;
  getboxwidth();
  getboxheight();
  getwindowdims();
  isloaded=true;
  if((W3C || IE4) && centertext)navtxt.style.textAlign="center";
  if(W3C)navtxt.style.padding='4px';
  if(IE4 || IE5 && dofade)navtxt.style.filter="alpha(opacity=0)";
  }
window.onresize=getwindowdims;


