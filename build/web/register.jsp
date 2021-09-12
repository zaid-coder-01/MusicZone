<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Music Zone</title>
  </head>
  <body class="log">
    
    <i style="font-size:3rem;">&#127928;<span style="font-size:1.5rem;">Music Zone</span> </i>
    
<div>
<div class="row mt-2" style="margin-top:5rem;">
<div class="col-md-4 sm-4 offset-2">
<div style="background-color:rgba(0,0,0,0.1); border-radius:2rem 0 0 2rem; height:24rem;margin-top:4rem;">

<div style=" margin-left:3.6rem;">
<h2 style="display:block; color:white; padding-top:3rem;">Millions Of New </h2>
<h4 style="display:block; color:white; padding-top:0.4rem; margin-left:5rem;">Songs</h4>
</div>

<div>
<p style="margin-left:4rem; padding-top:3rem; font-size:1.2rem;">Hindi English All Tpes Of Songs</p>
</div>
</div> 

</div>
<div class="col-md-4 sm-4">
<div style="background-color:rgba(0,0,0,0.2);border-radius:0 2rem 2rem 0; height:24rem; margin-left:-1.9rem;margin-top:4rem;">

    <form  id="fmt" action="newuser" method="post" enctype="multipart/form-data">
  <i class="fa fa-user" style="font-size:1.5rem; margin-left:6rem; margin-top:0.5rem; padding-top:0.5rem;"></i><input type="text"required placeholder="UserId" name="user" style="font-size:1.2rem; border:none; background-color:rgba(0,0,0,0); border-bottom: 0.1rem solid black; margin-top:3rem; margin-left:2rem;  outline:none; width:16rem;">
   
     <i class="fa fa-key" style="font-size:1.5rem; margin-left:6rem; "></i> <input type="password" required placeholder="password" name="pass" style=" font-size:1.2rem; border:none; background-color:rgba(0,0,0,0); border-bottom: 0.1rem solid black; margin-top:2.5rem; margin-left:1.5rem;  outline:none; width:16rem;">
    <i class="fa fa-envelope" style="font-size:1.5rem; margin-left:6rem; "></i> <input type="email" required placeholder="email" name="email" style=" font-size:1.2rem; border:none; background-color:rgba(0,0,0,0); border-bottom: 0.1rem solid black; margin-top:2.5rem; margin-left:1.5rem;  outline:none; width:16rem;">
       <i class="fa fa-picture-o" style="font-size:1.5rem; margin-left:6rem; "></i> <input type="file"required placeholder="email" name="pic" style=" font-size:1.2rem; border:none; background-color:rgba(0,0,0,0); border-bottom: 0.1rem solid black; margin-top:2.5rem; margin-left:1.5rem;  outline:none; width:16rem;">

 <button type="submit" style=" font-size:1.2rem; color:white; background-color:rgba(0,0,0,0.2); border-radius:2rem; width:7rem; margin-top:2rem; float:right; margin-right:1.5rem;">Create</button>
 
 <div style="margin-top:2rem;">
 <a href="login.jsp" style="margin-left:2rem; font-size:1.2rem; color:white; ">Login</a>
 </div>
  
 </form>

                       
</div> 

</div>
</div>
</div>
    
       <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    
    <script>
    
    $(document).ready(function(){
    $('#fmt').on('submit', function (event) {

                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({

                        url: 'newuser',
                        type: 'post',
                        data: form,

                        success: function (data, textstatus, jqXHR) {

                            alert("done");
                            $('#fmt').trigger('reset');
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