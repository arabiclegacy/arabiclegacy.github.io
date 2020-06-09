#!/usr/bin/tclsh

set WelcomeString "Generate Webpages"
#----------------------------------------------------

puts "start $WelcomeString process ..."

set include_pages [list \
	page_home.html    site_contents/home/content_home.html   home_list_attr \
	page_linux.html   site_contents/linux_commands/content_linux.html  linux_list_attr \
]




set home_list_attr {
    <a href="PATH_TO_REF#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
    <a href="PATH_TO_REF#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">             <i class="fa fa-user     fa-fw w3-margin-right"></i>ABOUT</a> 
    <a href="PATH_TO_REF#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">             <i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
}

set linux_list_attr {<a href="PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Linux COmMaNdS</a> }




set sidebar_content ""
foreach {TargetFile InputFile NameInList} $include_pages {

    set default_attr [subst [format {$%s} $NameInList] ]
    set adjusted_attr [format {string map {"PATH_TO_REF" "%s"} $default_attr} $TargetFile ]
    set adjusted_attr [eval $adjusted_attr]

    append sidebar_content $adjusted_attr "\n"
}



foreach {TargetFile InputFile NameInList} $include_pages {






set CreatedFile [ open published_pages/${TargetFile} w+ ]
set FileID [ open $InputFile r+ ]
set All_Content [read $FileID]




set CreatedFile_Content [subst {<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"><br><br>
    <h4><b>PORTFOLIO</b></h4>
    <p class="w3-text-grey">Template by W3.CSS</p>
  </div>
  <div class="w3-bar-block">
    $sidebar_content
  </div>
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

$All_Content

<!-- End of PAGE CONTENT -->
</div>


<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>


</body>


</html>
}]

puts $CreatedFile $CreatedFile_Content

close $CreatedFile

}


puts "generation is done successfully"