
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
            input{

                background-color:rgba(0,0,0,0);
                border-radius:0.6rem;
                outline:none;
                border: 1px solid white;
            }

            button{
                background-color:rgba(0,0,0,0);
                border-radius:0.6rem;
                width:8rem;
                font-size:1.3rem;
                border: 1px solid lightgray;
            }
        </style>
    </head>
    <body style="background-color:rgba(98,178,200,0.2);">


        <% users us = (users) session.getAttribute("curren");%>
        <!-- first navbar -->

        <div class="row">
            <div class="col-md-3" style="color: white;">
                <div class="lftna"
                     style="font-family: 'Cormorant Unicase', serif; width: 13rem; height: 100vh; padding-top: 3rem; padding-left: 3rem; background-color: rgba(60, 60, 60, 0.8); position: fixed;">
                    <img src="img/users/<%=us.getPic()%>" style="max-width:4rem; max-height:4rem; border-radius:50%;">
                    <br>
                    <a href="logout" style="padding-top: 3rem; font-family: 'Cormorant Unicase', serif; font-size: 1rem; color: white; text-decoration: none;">LOGOUT</a>
                    <div
                        style="margin-left: -1rem; color: black; font-family: 'Cormorant Unicase', serif;">
                        <i class="fa fa-bar-chart"
                           style="display: block; margin-top: 4rem;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                id="det" href="#"
                                style="font-family: 'Cormorant Unicase', serif; Margin-top: 4rem; font-size: 1.4rem; color: white; text-decoration: none;">Statics</a></i>
                        <i class="fa fa-music"
                           style="display: block; margin-top: 3rem;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                href="#"
                                id="sg"
                                style="Margin-top: 2rem; font-family: 'Cormorant Unicase', serif; font-size: 1.4rem; color: white; text-decoration: none;">Add
                                Songs</a></i> <i class="fa fa-user-o"
                                         style="display: block; margin-top: 3rem;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                id="addarti"
                                href="#"
                                style="Margin-top: 2rem; font-family: 'Cormorant Unicase', serif; font-size: 1.4rem; color: white; text-decoration: none;">Add Artist</a></i>
                        <i class="fa fa-cog" style="display: block; margin-top: 3rem;">&nbsp;&nbsp;&nbsp;&nbsp;<a
                                href="#"
                                style="Margin-top: 2rem; font-family: 'Cormorant Unicase', serif; font-size: 1.4rem; color: white; text-decoration: none;">Settings</a></i>
                    </div>

                </div>
            </div>
                    
                          <!-- Add details -->
                          
            <div class="col-md-9" id="detail"style="margin-top: 5rem; margin-left: -5rem;">

                <h1 style="margin-bottom:4rem;font-family: 'Redressed', cursive;">Dashboard</h1>


                <div class="col-md-4">
                      <%         SessionFactory factory = FactoryProvider.getFactory();
                                        Session uscount = factory.openSession();

                                        Query qury = uscount.createQuery("from users ");
                                       
                                        List<users> li = qury.list();
                                            
                                       uscount.close();

                                    %>
                    <div class="card text-center"style="background-color:rgba(254,165,209,0.5); border-radius:1rem;" >
                        <div class="card-body">
                            <img src="" style="max-width: 130px; max-height:90px; height:auto;">
                            <h2>Users</h2>
                            <h2><%=li.size()%></h2>

                        </div>
                    </div>
                </div>

                
                <div class="col-md-4" style="margin-left:21rem; margin-top:-10rem;">
                    <%         SessionFactory factoryy = FactoryProvider.getFactory();
                                        Session sesio = factoryy.openSession();

                                        Query quryy = sesio.createQuery("from Songs ");
                                       
                                        List<Songs> lit = quryy.list();
                                            
                                       sesio.close();

                                    %>
                    <div class="card text-center"style="background-color:rgba(224,198,212,0.5); border-radius:1rem; " >
                        <div class="card-body" >
                            <img src="" style="max-width: 130px; max-height:90px; height:auto;">
                            <h2>Songs</h2>
                            <h2><%=lit.size()%></h2>
                        </div>
                    </div>
                </div>

                <div class="col-md-4" style="margin-left:41rem; margin-top:-10rem;">
                             <%         SessionFactory factor = FactoryProvider.getFactory();
                                        Session ses = factor.openSession();

                                        Query qur = ses.createQuery("from artist ");
                                       
                                        List<artist> l = qur.list();
                                            
                                       ses.close();

                                    %>
                    <div class="card text-center" style="background-color:rgba(245,287,145,0.5); border-radius:1rem;">
                        <div class="card-body">
                            <img src="" style="max-width: 130px; max-height:90px; height:auto;">
                            <h2>Artist</h2>
                            <h2><%=l.size()%></h2>
                        </div>

                    </div>
                    <i style="font-size:2.5rem; float:right; margin-top:-21rem; margin-right:0rem;">&#127928;<span style="font-size:1.5rem;">Music Zone</span> </i>
                </div>
            </div>


            <!-- Add song -->

            <div class="col-md-9" id="addsong"style="margin-top: 6rem; margin-left: -5rem;">
                <h1 style="margin-top:-1rem; font-family: 'Redressed', cursive; margin-bottom:3rem;">Add Songs</h1>
                <div style="margin-left:1rem; width:100%">
                    <div class="col-md-12" style="">
                        <div class="card" style="height:24rem; background-color:rgba(0,0,0,0.1);">
                            <div class="card-body" style="background-color:rgba(0,0,0,0.1);">
                                <form id="frm"  action="savesong" method="post" enctype="multipart/form-data" style="margin-top:3rem;">

                                    <div style="display:block; margin-left:3rem;">
                                        <label style="font-size:1.3rem;">Category</label>
                                        <input type="text" name="cate" style="margin-left:1.5rem; width:16rem;">
                                        <label style="font-size:1.3rem; margin-left:3rem;">Language</label>
                                        <input type="text" name="lang" style="margin-left:1.7rem; width:16rem;">

                                    </div>

                                    <div style="display:block; margin-left:3rem; margin-top:2rem;">
                                        <label style="font-size:1.3rem;">Artist</label>
                                        <input type="text" name="art" style="margin-left:3.5rem; width:16rem;">
                                        <label style="font-size:1.3rem; margin-left:3rem;">Song Name</label>
                                        <input type="text" name="sname" style="margin-left:0.8rem; width:16rem;">

                                    </div>
                                    <div style="display:block; margin-left:3rem; margin-top:2rem;">
                                        <label style="font-size:1.3rem;">Song</label>
                                        <input type="file" name="song" style="margin-left:4rem; width:16rem;">
                                        <label style="font-size:1.3rem; margin-left:2.4rem;">Thumbnail</label>
                                        <input type="file" name="thum" style="margin-left:2rem; width:16rem;">

                                    </div>


                                    <div class="mt-5">
                                        <button type="submit" style="float:right; margin-right:2rem;">Upload</button>
                                    </div>


                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <i style="font-size:2.5rem; float:right; margin-top:-34.5rem; margin-right:0rem;">&#127928;<span style="font-size:1.5rem;">Music Zone</span> </i>


            </div>
            
      <!-- Add art -->

            <div class="col-md-9" id="addart"style="margin-top: 6rem; margin-left: -5rem;">
                <h1 style="margin-top:-1rem; font-family: 'Redressed', cursive; margin-bottom:3rem;">Add Artist</h1>
                <div style="margin-left:1rem; width:100%">
                    <div class="col-md-12" style="">
                        <div class="card" style="height:24rem; background-color:rgba(0,0,0,0.1);">
                            <div class="card-body" style="background-color:rgba(0,0,0,0.1);">
                                <form id="fr"  action="saveart" method="post" enctype="multipart/form-data" style="margin-top:3rem;">

                                    <div style="display:block; margin-left:3rem;">
                                        <label style="font-size:1.3rem;">Artist</label>
                                        <input type="text" name="art" style="margin-left:4.5rem; width:16rem;">

                                        <label style="font-size:1.3rem; margin-left:2.4rem;">Thumbnail</label>
                                        <input type="file" name="thum" style="margin-left:2rem; width:16rem;">

                                    </div>

                                    <div style="display:block; margin-left:3rem; margin-top:2rem;">

                                         <label style="font-size:1.3rem;">Language</label>
                                        <input type="text" name="lang" style="margin-left:2rem; width:16rem;">

                                    </div>



                                    <div class="mt-5">
                                        <button type="submit" style="float:right; margin-right:2rem;">Upload</button>
                                    </div>


                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <i style="font-size:2.5rem; float:right; margin-top:-34.5rem; margin-right:0rem;">&#127928;<span style="font-size:1.5rem;">Music Zone</span> </i>



            </div>

        </div>



        <!-- ended song -->






        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <script>

            $(document).ready(function () {
                console.log("loaded");

                $("#detail").show();
                $('#addsong').hide();
                $('#addart').hide();

                $('#det').click(function () {
                    $("#detail").show();
                    $('#addsong').hide();
                    $('#addart').hide();
                });
                $('#sg').click(function () {
                    $("#addsong").show();
                    $('#detail').hide();
                    $('#addart').hide();
                });
                $('#addarti').click(function () {
                    $("#addsong").hide();
                    $('#detail').hide();
                    $('#addart').show();

                });


                $('#frm').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({

                        url: 'savesong',
                        type: 'post',
                        data: form,

                        success: function (data, textstatus, jqXHR) {

                            alert("done");
                            $('#frm').trigger('reset');
                        },
                        error: function (jqXHR, textstatus, errorThrown) {
                            console.log(jqXHR);
                            alert("error");
                        },
                        processData: false,
                        contentType: false
                    });

                });

                $('#fr').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({

                        url: 'saveart',
                        type: 'post',
                        data: form,

                        success: function (data, textstatus, jqXHR) {

                            alert("done");
                            $('#frm').trigger('reset');
                        },
                        error: function (jqXHR, textstatus, errorThrown) {
                            console.log(jqXHR);
                            alert("error");
                        },
                        processData: false,
                        contentType: false
                    });

                });



            });
        </script>  




    </body>
</html>