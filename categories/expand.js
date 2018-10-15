var menu, menu2, cookieA,cookieA2, cookieC;
//global variables

function menu_initiate()
{
  cookieC=0;

  if(document.cookie)
  {
    cookieA=document.cookie.split(";");
    cookieA2=new Array();
    for(i in cookieA)
    {
      cookieA2[ cookieA[i].split("=")[0].replace(/ /g,"") ] = cookieA[i].split("=")[1].replace(/ /g,"");
    }
  }

  cookieA = ( document.cookie.indexOf("state=")>=0 ) ? cookieA2["state"].split(",") : new Array();
 
  menu = document.getElementById("categories");
  
  for( var o=0; o< menu.getElementsByTagName("li").length;o++)
  {
    if(menu.getElementsByTagName("li")[o].getElementsByTagName("ul").length>0)
    {
      menu2 = document.createElement("span");
      menu2.className = "images";
      menu2.style.backgroundImage = (cookieA.length>0)?((cookieA[cookieC]=="true")? "url('minus.png')":"url('plus.png')"):"url('plus.png')";
     
      menu2.onclick = function()
      {
        show_hide(this.parentNode);
        wCookie();//save state
      }

      menu.getElementsByTagName("li")[o].insertBefore(menu2,menu.getElementsByTagName("li")[o].firstChild)
      menu.getElementsByTagName("li")[o].getElementsByTagName("ul")[0].style.display = "none";
      
     if(cookieA[cookieC]=="true")
      {
        show_hide(menu.getElementsByTagName("li")[o]);
      }
      cookieC++;
    }
    else
    {
      menu2 = document.createElement("span");
      menu2.className = "images";
      menu2.style.backgroundImage = "url('bullet.png')";
      menu.getElementsByTagName("li")[o].insertBefore(menu2,menu.getElementsByTagName("li")[o].firstChild);
    }
  }
}

function show_hide(el)
{
  el.getElementsByTagName("ul")[0].style.display = ( el.getElementsByTagName("ul" )[0].style.display == "block" ) ? "none" : "block";
  el.getElementsByTagName("span")[0].style.backgroundImage = ( el.getElementsByTagName("ul")[0].style.display=="block" ) ? "url('minus.png')":"url('plus.png')";
}

function wCookie()
{ 
  cookieA=new Array()
  for( var c = 0;c < menu.getElementsByTagName("li").length; c++ ) 
  {
    if( menu.getElementsByTagName("li")[c].childNodes.length>0 )
    {
      if ( menu.getElementsByTagName("li")[c].childNodes[0].nodeName == "SPAN" && menu.getElementsByTagName("li")[c].getElementsByTagName("ul").length>0 )
      {
        cookieA[ cookieA.length ] = ( menu.getElementsByTagName("li")[c].getElementsByTagName("ul")[0].style.display=="block" );
      }
    }
  }
  document.cookie="state="+cookieA.join(",")+";expires="+new Date(new Date().getTime() + 365*24*60*60*1000).toGMTString();
  //set cookie expiration to 1 year
}
