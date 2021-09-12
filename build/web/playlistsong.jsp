

<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import ="helper.*" %>
<%@ page import ="entity.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="org.hibernate.Criteria" %>
<%@ page import ="org.hibernate.*" %>
<%@ page import ="org.hibernate.Session" %>
<%@ page import ="javax.servlet.http.HttpSession" %>


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital@1&display=swap" rel="stylesheet">
        <title>Music Zone</title>
        <style>
            *{
                color:white;

            }

            .xyz > span {
                display: none;

            }

            .xyz:hover > span
            {
                display: block;
            }
            .hlis a > span  {
                display: none;
                

            }

            .hlis:hover  span
            {
                display: block;
                cursor: pointer;
                
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
    <body  style="background-color:rgba(0,0,0,0.9);overflow-x: hidden;">
        <% users us = (users) session.getAttribute("current"); %>



        <!-- first navbar -->
        <div>

            <div class="row">
                <div class="col-md-3 " style="color:white; position: relative;">
                    <div  style="width: 13rem;height:100vh;padding-top:3rem;padding-left:3rem;background-color:rgba(0,0,0,0.6); position: fixed;  overflow-y: auto;">
                        <%
                            if (us == null) {
                        %>
                        <a href="login.jsp" style=" color:white; display:block; padding-top:0.8rem;"><i class="fa fa-user-circle" style="font-size:4rem;"></i></a>
                            <% } else {%>
                        <a  style=" color:white; display:block; padding-top:0.8rem;"><img src="img/users/<%=us.getPic()%>" style="max-width:4rem; max-height:4rem; border-radius:50%;"></a>
                           <a href="logout" style=" color:white; text-decoration:none; display:block; font-size:0.9rem; padding-top:0.8rem;">LOGOUT</a>    
                        <%} %>
                        <div style="margin-top:2rem; margin-left:-0.7rem; font-size:1.2rem; padding-top:0.5rem;">
                            <p>Library</p>

                            <a href="index.jsp" style=" color:white; text-decoration:none; display:block; font-size:1rem; padding-top:0.8rem;"><i class="fa fa-home"></i>&nbsp;&nbsp; Home</a>
                       
                            <% if(us!=null){%>
                            <a href="recent.jsp" style=" color:white; text-decoration:none; display:block; font-size:1rem; padding-top:0.8rem;"><i class="fa fa-clock-o"></i>&nbsp;&nbsp; Recent</a>
                          <%}%>
                            <a  href="#" style=" color:white; text-decoration:none; display:block; font-size:1rem; padding-top:0.8rem;"><i class="fa fa-clone"></i>&nbsp;&nbsp; Albums</a>

                        </div>

                        <%
                            if (us != null) {
                        %>
                        <div style="margin-top:1.6rem;color:white; margin-left:-0.7rem; font-size:1.2rem; padding-top:0.5rem;">
                            <p>Playlist</p>


                            <%
                                SessionFactory playfac = FactoryProvider.getFactory();

                                Session playses = playfac.openSession();

                                Query pquery = playses.createQuery("from Playlist where userid=:a ");
                                pquery.setParameter("a", us.getUserid());

                                List<Playlist> plist = pquery.list();

                                for (Playlist pt : plist) {

                            %>

                           <div class="hlis">
                              <a href="playlistsong.jsp?listname=<%=pt.getPlaylistname()%>">  <p style="font-size:1rem; position: relative;"><%=  pt.getPlaylistname()%></p></a><a href="dellist?dd=<%=pt.getPlaylistname()%>"><span class="fa fa-minus" onclick="f('<%=pt.getPlaylistname()%>');" style="margin-left:8rem; margin-top: -2rem; position: absolute; "></span></a>
                            </div>
                            


                            <%    }

                                playses.close();

                            %>
                            <div id="playN" >
                                <form id="clist" action="savelist" method="post">
                                    <input type="text" name="list" style="width:6rem; font-size:0.8rem; margin-left:-0.2rem; background-color:rgba(0,0,0,0);  font-weight:bold; border: 0.1rem solid lightgray; border-radius:0.6rem 0 0 0.6rem  ;">
                                    <button type="submit" style="font-size:0.8rem;background-color:rgba(0,0,0,0);border-radius:0  0.6rem 0.6rem 0; ">Create</button>
                                </form>
                            </div>

                            <a id="addplay" style=" cursor:pointer;  color:white;display:block; font-size:1rem; padding-top:0.3rem;"><i class="fa fa-plus"></i>&nbsp; Add Playlist</a>

                        </div>
                        <%} %>

                    </div>
                </div>
                <div class="col-md-9   " style="margin-left: -3rem; position: relative;">

                    <div class="row">
                        <div class="col-md-12  m-0 p-0">

                            <%

                                String name = request.getParameter("listname");

                            %>
                            <div style=" margin-left: 0rem; position:fixed; width: 100%; background-color: rgba(0,0,0,1); z-index: 1; height: 5rem; " >
                                <form action="searchpage.jsp" method="post" style="margin-top:0.7rem;">
                                    <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                                    <input type="text" name="search" class="srch" id="sh" placeholder="search song" autocomplete="off">
                                </form>

                                <h1 style="color:white; font-size: 1.6rem; float: right; margin-right: 17rem; margin-top: -3.5rem;"> <span style="font-size:3rem;">&#127928;</span>Music Zone</h1>

                            </div>

                            <div id="show" style="position:absolute; z-index: 1 ;margin-top:4rem;margin-left: 2.6rem; width: 14.6rem; position: fixed; background-color: rgba(0,0,0,0.9);">
                                <ul class="list-group" style="background-color: rgba(0,0,0,0.9);" >

                                </ul>

                            </div>

                            <div style="  font-family: 'Playfair Display', serif;">
                                <div style="margin-top:8rem;">
                                    <img  id="listimg" src="img/kl.jpg" style="max-width: 250px; max-height: 200px;">
                                </div>
                                <div style="margin-left: 15rem; margin-top: -12rem; font-size: 1.2rem;">
                                    <p >PlayList</p>
                                    <p style="font-size:2rem;"><%=name%></p>
                                    <small style="font-size:1rem;">created by </small>&nbsp;&nbsp;<span><%=us.getUserid()%></span>
                                </div>
                            </div>
                            <div style="margin-top: 8rem;">
                                <ul class="list-group">
                                    <%         SessionFactory f = FactoryProvider.getFactory();
                                        Session ss = f.openSession();

                                        Query q = ss.createQuery("from listsong where userid=:g and playlistname=:jh ");
                                        q.setParameter("g", us.getUserid());
                                        q.setParameter("jh", name);

                                        List<listsong> list = q.list();

                                        for (listsong mu : list) {
                                    %>
                                      <li class="list-group-item" style="background-color:rgba(0,0,0,0.6); width: 50rem;font-size: 1.4rem;">
                                          <a href="lplay.jsp?ph=<%=mu.getPic()%>&song=<%=mu.getSong()%>&lname=<%=mu.getPlaylistname()%>">   <span style="color:white;margin-left: 1rem; font-family: 'Playfair Display', serif;"><%=mu.getPlaylistsong()%></span></a>

                                        <div class="pl" style="margin-top:-2rem;">
                                            <a onclick="ddf('<%=mu.getSong()%>')">  <i class="fa fa-plus" style="font-size:1rem; float: right; margin-left: 1.7rem;margin-top: 0.4rem; font-family: 'Playfair Display', serif; cursor:pointer;">&nbsp; Remove From  Playlist</i></a>

                                            <span class="fa fa-play-circle" style="font-size: 1.9rem; float: right;" id="py" onclick="gt('<%=mu.getSong()%>')"></span>
                                        </div>

                                    </li>
                                    
                                    <br>
                                    <%  }

                                        ss.close();

                                    %>

                                </ul>
                                <audio src="" id="sgn"></audio>

                            </div>

                        </div>

                        <!--search-->


                    </div>

                </div>


            </div>





            <!-- first bav ended -->





            <!--script-->

            <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

            <!-- script end -->
            <Script>
                                                let sog = document.getElementById('sgn');
                                                let ig = document.getElementById('ig');


                                                         let ff;
                                                       function f(x)
                                                       {
                                                          ff=x; 
                                                       } 
                                                       
                                                let h;

                                                let playing = false;
                                                function gt(x)
                                                {
                                                    h = x;
                                                }

                                                function pla()
                                                {
                                                    sog.src = "img/musics/" + h;
                                                    playing = true;
                                                    sog.play();
                                                      df(h)

                                                }
                                                function pase()
                                                {
                                                    playing = false;
                                                    sog.pause();

                                                }


                                                $('.pl span').on('click', function () {
                                                    $('.pl span').removeClass("fa-pause");
                                                    $('.pl span').addClass("fa-play-circle");
                                                    if (playing)
                                                    {
                                                        $('li').removeClass("active");
                                                        $('.pl span').removeClass("fa-pause");
                                                        $('.pl span').addClass("fa-play-circle");



                                                    }
                                                    if (playing)
                                                    {
                                                        $(this).removeClass("fa-pause");
                                                        $(this).addClass("fa-play-circle");
                                                        pase();
                                                        $(this).closest("li").addClass("active");
                                                    } else {
                                                        $("li").removeClass("active");
                                                        $(this).removeClass("fa-play-circle");
                                                        $(this).addClass("fa-pause");
                                                        $(this).closest("li").addClass("active");


                                                        pla();
                                                    }


                                                });




                                                const songs = [

                <%                for (listsong m : list) {

                %>
                                                    {
                                                        son: "<%=m.getSong()%>"

                                                    },
                <% }%>
                                                ];

                                                const ldsong = (songs) =>
                                                {

                                                    sog.src = "img/musics/" + songs.son;
                                                    sog.play();
                                                    h = songs.son;
                                                };

                                                ind = 0;

                                                function nexts()
                                                {

                                                    ind = (ind + 1) % songs.length;
                                                    songs[ind];

                                                    ldsong(songs[ind]);


                                                }
                                                sog.addEventListener("ended", function () {

                                                    $('li').removeClass("active");
                                                    $('.pl span').removeClass("fa-pause");
                                                    $('.pl span').addClass("fa-play-circle");
                                                    pase();

                                                    nexts();
                                                    var element = document.querySelectorAll(' .pl span')[ind];

                                                    element.classList.replace('fa-play-circle', 'fa-pause');
                                                    document.querySelectorAll('li')[ind].classList.add("active");

                                                });



                                                $(document).ready(function () {



                                                    $('#sh').keyup(function () {
                                                        var search = $('#sh').val();

                                                        if (search !== ' ' && search !== null)
                                                        {

                                                            $.ajax({

                                                                url: 'srch.jsp',
                                                                type: 'POST',
                                                                data: 'key=' + search,

                                                                success: function (data)
                                                                {

                                                                    $('#show').html(data);

                                                                }

                                                            });
                                                        } else {
                                                            $('#show').html('no data ');
                                                        }

                                                    });
                                                    $(document).on('click', '#op', function () {
                                                        $('#sh').val($(this).text());
                                                        $('#show').html("");
                                                    });
                                                    
                                                                                          
                        $('#clist').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({

                        url: "savelist",
                        type: 'post',
                        data: form,
                        success: function (data, textstatus, jqXHR) {

                            alert("done");
                            location.reload();
                        },
                        error: function (jqXHR, textstatus, errorThrown) {
                            console.log(jqXHR);
                            alert("error");
                        },
                        processData: false,
                        contentType: false


                    });

                });
                
                $('.hlis span').click(function(event){
              event.preventDefault();
              
              
             $.ajax({
                 
                 url:'dellist',
                 type:'post',
                 data: 'dd='+ff,
                 
                 success:function(data)
                 {
                     location.reload();
                 }
                 
             });
                 
                });
                
         
                
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
            
           function ddf(c){
            let g=c;
      
                          $.ajax({
 
                 
                 url:'delsong',
                 type:'post',
                 data:'song='+g,
                 
                 success:function(data)
                 {
                   alert("deleted");
                   location.reload();
                 }
                 
             });
       

       }


                                                $('#playN').hide();

                                                document.getElementById('addplay').addEventListener("click", function () {

                                                    $('#playN').toggle();

                                                });



            </Script>



    </body>
</html>

