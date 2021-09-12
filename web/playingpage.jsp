
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import ="helper.*" %>
<%@ page import ="entity.*" %>
<%@ page import ="javax.servlet.http.HttpSession" %>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
              crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Redressed&display=swap" rel="stylesheet">
        <title>Music Zone</title>

        <style>
            *{
                font-family: 'Redressed', cursive;
                color: white;
            }
            select option{
                background-color: rgba(0,0,0,0.8);
            }
        </style>
            <style>
/* width */
::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: black; 
  border-radius: 10px;
}


</style>
    </head>
    <body style="background-color:rgba(0,0,0,0.8);">

        <% users us = (users) session.getAttribute("current"); %>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color:rgba(0,0,0,1);">
            <a class="navbar-brand" href="#" style="font-size:2rem;">&#127928;<span style="font-size:1.5rem;">Music Zone</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto" style="margin-right:3rem;">
                    <% if (us != null) {%>
                    <li class="nav-item">
                        <img src="img/users/<%= us.getPic()%>" style="max-width:3rem; max-height: 3rem; height: auto; border-radius: 40%;  margin-top: 0.5rem;">&nbsp;
                    </li>
                    <%}%>
                </ul>
            </div>
        </nav>

        <!--navbar end-->
        <%
            String p = request.getParameter("ph");
            String q = request.getParameter("song");
            String n = request.getParameter("sname");
            String a = request.getParameter("art");
            String cat = request.getParameter("cat");


            SessionFactory f = FactoryProvider.getFactory();
            Session ss = f.openSession();

            Query qy = ss.createQuery("from Songs where category=:j ");
            qy.setParameter("j",cat);

            List<Songs> list = qy.list();

        %>
     
        <div class="container" style="position:relative;">
            <div class="row mt-5">
                <div class="col-md-11 " style="background-color:rgba(0,0,0,0.3); height: 28rem; margin-left: 3rem;">
                   
       
                    <div  id="plist" style="margin-top:19rem; margin-left: 27rem; position: absolute;  height: auto; width: auto;  z-index: 1">
                        <ul style="overflow-y:auto; " >
                            <% 
                                if(us!=null){
    
    SessionFactory playfac=FactoryProvider.getFactory();
    
      Session playses =    playfac.openSession();
      
         Query pquery =playses.createQuery("from Playlist where userid=:a ");
         pquery.setParameter("a", us.getUserid());
         
          List<Playlist> plist = pquery.list();
          
for(Playlist pt:plist)
{

    %>
    <div class="adsog">
        <a href="">   <li style="list-style:none; margin-left:-1rem; text-align: center; font-size: 1rem;"><%=  pt.getPlaylistname() %></li></a>
    </div>            
                             <%    }

    playses.close();
}
    %>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="">
                            <img src="img/musics/<%= p%>"  id="ig" style="max-width:33rem; max-height: 14rem; border-radius: 2rem; margin-left: 6rem; margin-top: 3rem;" >
                            <br>

                                                            <div style="margin-top:0.8rem;">
                                                                <select id="spd" style="width:5rem; height: 1.5rem; margin-left:7rem; background-color: rgba(0,0,0,0);" >
                                    
                                    <option  value="1">normal</option>
                                    <option  value="0.4">slow</option>
                                    <option value="2">fast</option>
                                </select>
                                </div>
                    
                            <div style="margin-left: 13.5rem; font-size: 1.7rem;  color: white;margin-top: -2rem;">
                                <audio src="img/musics/<%= q%>" id="sg"></audio>

                                <i id="bk" class="fa fa-backward"style=" cursor: pointer;  "></i>
                                <i id="ply" class="fa fa-play-circle"style=" color: white;cursor: pointer;margin-left:2rem; "></i>
                                <i id="fwd" class="fa fa-forward"style=" cursor: pointer;margin-left:2rem; "></i>
                                <i id="rnd" class="fa fa-random"style=" cursor: pointer;margin-left:2rem; "></i>
                                <i id="plst" class="fa fa-bars"style=" cursor: pointer;margin-left:2rem; "></i>
                            </div>
                                <i class="fa fa-volume-up" style="margin-top:2.3rem; margin-left: 53rem;"></i>
                        </div>
                        <div class="col-md-6">
                            <p style="margin-left:3rem; margin-top:3rem; color:white; font-size:1.8rem;">  Song : &nbsp;&nbsp; <span  id="nam" style="font-size:1.6rem;" ><%=n%> </span></p>
                            <p style="margin-left:3rem; margin-top:1rem; color:white; font-size:1.8rem;">  Artist : &nbsp;&nbsp; <span  id="art" style="font-size:1.6rem;"><%=a%>  </span></p>
                        
                            <div>
                               
                                <span>
                                <input type="range"  id="vol" min="0" max="100" value="100" onchange="volumechange()" style="margin-top:12rem; margin-left: 22rem;">
                                </span>
                            </div>
                        
                        </div>
                    </div>
                    <div  style="width: 100%; height: 3rem; background-color: white;  margin-top: 0.4rem;  background-color: rgba(0,0,0,0.5); display: flex; justify-content: center;">
                        <div id="scur" style="margin-left: -1rem; margin-top: 0.8rem; margin-right: 2rem;  color: white;">00:00</div>

                        <div  id="clk" style="height: 0.6rem; width: 80%; border-radius: 1rem; background-color: white; margin-top: 1.3rem; position: relative;">
                            <div id="prg" style="height: 0.6rem; width: 0%;border-radius: 1rem; background-color: red; position: absolute; top: 0; left: 0;">

                            </div>


                        </div>
                        <div id="stime" style="margin-left: 2rem; margin-top: 0.8rem; color: white;">00:00</div>
                    </div> 

                </div>
            </div>
        </div>



          <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <script>
            let ply = document.getElementById('ply');
            let sg = document.getElementById('sg');
            let ig = document.getElementById('ig');
            let rnd = document.getElementById('rnd');
            let vol=document.getElementById('vol');
             let sp=document.getElementById('spd').value;
             let s=document.getElementById('spd');
               
           $('#plist').hide();
           
         let ggg='<%=n%>';
         let gg='<%=q%>';
         let igm='<%=p%>';
         
 document.getElementById('plst').addEventListener("click",function(){
	 
	  $('#plist').toggle();
	 
 });
           
            let lop = false;

            function rd()
            {
                lop = false;
                sg.loop = false;
                rnd.classList.replace("fa-exchange", "fa-random");
            }
            function lp()
            {

                lop = true;
                sg.loop = true;
                rnd.classList.replace("fa-random", "fa-exchange");

            }


            rnd.addEventListener("click", () => {
                if (lop)
                {
                    rd();
                } else {
                    lp();
                }

            });


            let playing = false;

            function pla()
            {
                playing = true;

                ply.classList.replace("fa-play-circle", "fa-pause");
                sg.play();
                df(gg);
            }
            function pause()
            {
                playing = false;

                ply.classList.replace("fa-pause", "fa-play-circle");
                sg.pause();
            }

            ply.addEventListener("click", () => {

                if (playing)
                {
                    pause();
                } else {
                    pla();
                }

            });

            sg.addEventListener("timeupdate", (event) => {
                
                const {duration, currentTime} = event.srcElement;

                let dur = Math.floor(duration / 60);
                let sec = Math.floor(duration % 60);

                if (duration) {

                    if (dur < 10)
                    {
                        dur = "0" + dur;
                    }

                    if (sec < 10)
                    {
                        sec = "0" + sec;
                    }


                    document.getElementById('stime').textContent = dur + ":" + sec;
                }
                   let cut = Math.floor( currentTime/ 60);
                   let cusec = Math.floor(currentTime % 60);
                if (cut < 10)
                {
                    cut = "0" + cut;
                }

                if (cusec < 10)
                {
                    cusec = "0" + cusec;
                }

                document.getElementById('scur').textContent = cut + ":" + cusec;

                let pg = (currentTime / duration) * 100;

                document.getElementById("prg").style.width = pg + "%";



            });
            document.getElementById("clk").addEventListener("click", (event) => {

                const {duration} = sg;
                let ru = (event.offsetX / event.srcElement.clientWidth) * duration;
                sg.currentTime = ru;


            });

            document.onkeydown = f;

            function f(e)
            {
                if (e.keyCode == '32')
                {
                    if (playing)
                    {
                        pause();
                    } else {
                        pla();
                    }


                }
                else if (e.keyCode == '39')
                {
                    sg.currentTime = sg.currentTime + 1;
                } 
                else if (e.keyCode == '37')
                {
                    sg.currentTime = sg.currentTime - 1;
                }
            }


//                all song


            const songs = [

            <%
         for (Songs m : list) {

            %>
                {
                    pic: "<%=m.getThumb()%>",
                    son: "<%=m.getSong()%>",
                    name: "<%=m.getSongName()%>",
                    art: "<%=m.getArtist()%>",
                },
            <% }%>
            ];

            const ldsong = (songs) =>
            {
                document.getElementById('nam').textContent = songs.name;
                document.getElementById('art').textContent = songs.art;
                sg.src = "img/musics/" + songs.son;
                ig.src = "img/musics/" + songs.pic;
                ggg=songs.name;
                gg=songs.son;
                igm=songs.pic;
    
    
          
            };


            ind = 0;

            function nexts()
            {
                    $('#plist').hide();
                   sg.playbackRate=1;
                   s.selectedIndex="0";
                ind = (ind + 1) % songs.length;
                songs[ind];

                ldsong(songs[ind]);
                pla();

            }

            function prev()
            {
                    $('#plist').hide();
                sg.playbackRate=1;
                ind = (ind - 1 + songs.length) % songs.length;
                songs[ind];

                ldsong(songs[ind]);
                pla();
            }

            sg.addEventListener("ended", nexts);
            
            
//            volume

function volumechange()
{
    sg.volume = vol.value/100;
}


document.getElementById('spd').addEventListener("change", (event) =>{
    
    let sp=document.getElementById('spd').value;
    sg.playbackRate=sp;
    
});



 function df(c){
 let gh=c;
             $.ajax({
                 
                 url:'saverecent',
                 type:'post',
                 data: 'rec='+gh,
                 
                 success:function(data)
                 {
                   console.log(data);
                 }
                 
             });

       }


            document.getElementById('fwd').addEventListener("click", nexts);
            document.getElementById('bk').addEventListener("click", prev);


$(document).ready(function(){
    $('.adsog li').click(function(){
      let yy=  $(this).html();
        

       $.ajax({
 
                 
                 url:'savelistsong',
                 type:'post',
                 data: {sname:yy , sss:ggg , gg:gg , ph:igm },
                 
                 success:function(data)
                 {
                   alert("done");
                 }
                 
             });
        
       
    });
  
});


        </script>

    </body>
</html>