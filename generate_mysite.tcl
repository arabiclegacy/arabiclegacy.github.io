#!/usr/bin/tclsh

set WelcomeString "Generate Webpages"
#----------------------------------------------------

puts "start $WelcomeString process ..."

set include_pages [list \
	000/home.html    site_contents/00_home/content_home.html   home_list_attr \
]




set home_list_attr {
    <a href="../PATH_TO_REF#root"    onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_ITEM_COLOR"><i class="fa fa-home     fa-fw w3-margin-left w3-right"></i><div class="w3-right-align">الرئيسية</div> </a> 
    <a href="../PATH_TO_REF#about"   onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">             <i class="fa fa-user     fa-fw w3-margin-left w3-right"></i><div class="w3-right-align">مقدم المحتوى</div></a> 
    <a href="../PATH_TO_REF#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">             <i class="fa fa-envelope fa-fw w3-margin-left w3-right"></i><div class="w3-right-align">للاتصال بنا</div></a>
}
# Note: icons of the list can be reviewed at
# https://www.w3schools.com/icons/fontawesome_icons_webapp.asp

set linux_list_attr {<a href="PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Linux COmMaNdS</a> }




set sidebar_content ""
foreach {TargetFile InputFile NameInList} $include_pages {

    set default_attr [subst [format {$%s} $NameInList] ]
    set adjusted_attr [format {string map {"PATH_TO_REF" "%s" "ACTIVE_ITEM_COLOR" "%s"} $default_attr} $TargetFile "w3-text-teal"]
    set adjusted_attr [eval $adjusted_attr]

    append sidebar_content $adjusted_attr "\n"
}



foreach {TargetFile InputFile NameInList} $include_pages {






set CreatedFile [ open ${TargetFile} w+ ]
set FileID [ open $InputFile r+ ]
set All_Content [read $FileID]

# style="margin-right:30%"
# body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

set CreatedFile_Content [subst {<!DOCTYPE html>
<html dir="rtl" lang="ar">
<title>إرث عربي</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../interface_css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Amiri}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-right" style="z-index:3;width:18%;right:0" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
    <i class="fa fa-remove"></i>
    </a>
    <img src="/w3images/avatar_g2.jpg" style="width:45%;" class="w3-round"><br><br>
    <h4><b>إرث عربي</b></h4>
    <p class="w3-text-grey">ملفات شخصية</p>
  </div>
  <div class="w3-bar-block">
    <div class="w3-right">
    $sidebar_content
      </div>
  </div>
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-right:20%">
<img src="../000/shots/self_arab_cover.png" style="width:100%;" class="w3-round">

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