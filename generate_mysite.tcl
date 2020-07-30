#!/usr/bin/tclsh

set WelcomeString "Generate Webpages"
#----------------------------------------------------

puts "start $WelcomeString process ..."

set include_pages [list \
	000/home.html    site_contents/00_home/content_home.html   home_list \
	002/tajweed.html    site_contents/01_01_tajweed/tajweed.html   tajweed_list \
	003/paradigm.html    site_contents/01_02_paradigm/paradigm.html   paradigm_list \
	004/qinfo.html    site_contents/01_03_Qinfo/Qinfographic.html   qinfo_list \
	001/islamic_home.html    site_contents/01_00_islamic/islamic_home.html   islamic_list \
]




set home_list [list MAIN_LIST \
{
    <a href="../PATH_TO_REF#root"    onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR"><i class="fa fa-home     fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">الرئيسية</div> </a> 
    <a href="../PATH_TO_REF#about"   onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">                  <i class="fa fa-user     fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">مقدم المحتوى</div></a> 
    <a href="../PATH_TO_REF#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">                  <i class="fa fa-envelope fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">للاتصال بنا</div></a>
}]
# Note: icons of the list can be reviewed at
# https://www.w3schools.com/icons/fontawesome_icons_webapp.asp



set islamic_list [list MAIN_LIST \
 { 
<button  onclick="myAccFunc('demoAcc')" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR" >
  <i class="fa fa-book fa-fw w3-margin-left w3-padding-small w3-right"></i>
  <a href="../PATH_TO_REF" onclick="w3_close()" class="w3-right w3-margin-left"> <div class="w3-right">ملفات إسلامية</div></a>
  <i class="fa fa-caret-down fa-fw w3-padding-small w3-right"></i>
</button>
<div id="demoAcc" class="w3-hide w3-container">
  SUB_LIST
</div> }]


set tajweed_list [list islamic_list \
 { <a href="../PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">تجويد القرآن</div></a> } ]

set paradigm_list [list islamic_list \
 { <a href="../PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">النموذج المعرفي</div></a> } ]

set qinfo_list [list islamic_list \
 { <a href="../PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">Quran Infographic</div></a> } ]


set sidebar_content ""
foreach {TargetFile InputFile NameInList} $include_pages {

    set default_attr [subst [format {$%s} $NameInList] ]

    foreach {position list_content} $default_attr {
        set adjusted_attr [format {string map {"PATH_TO_REF" "%s" "ACTIVE_LIST_COLOR" "%s"} $list_content} $TargetFile ACTIVE_${NameInList}_LIST_COLOR]
        set adjusted_attr [eval $adjusted_attr]

        if [string match  {*MAIN_LIST*} $position] {
            append sidebar_content $adjusted_attr "\n"
        } else {
            set parent_list [subst [format {$%s} $position] ]
            set sublist_content [format {string map {"SUB_LIST" {%s SUB_LIST} } $parent_list} $adjusted_attr ]
            set $position [eval $sublist_content]
        }
    }
}


foreach {TargetFile InputFile NameInList} $include_pages {



set CreatedFile [ open ${TargetFile} w+ ]
set FileID [ open $InputFile r ]
set All_Content [read $FileID]

# body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

set CreatedFile_Content [subst {<!DOCTYPE html>
<html dir="rtl" lang="ar">
<title>Arabic Legacy</title>
<link rel="icon" href="../000/shots/arabiclegacy_logo.png">
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
    <img src="../000/shots/arabiclegacy_logo.png" style="width:45%;" class="w3-round"><br>
    <h3><b>إرث عربي</b></h3>
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
<img src="../000/shots/self_arab_cover_lower.png" style="width:100%;" class="w3-round">

<nav class="w3-bar w3-sand w3-border w3-padding-small" id="myHorzBar">
    <img src="../000/shots/arabiclegacy_logo.png" style="width:5%;" class="w3-round w3-right w3-padding-small">
    $sidebar_content
</nav>

$All_Content

<!-- End of PAGE CONTENT -->
<div class="w3-bar w3-light-grey"> 
<div class="w3-bar-item">Arabic Legacy - All Rights Reserved</div>
</div>

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

function myAccFunc(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-green";
  } else { 
    x.className = x.className.replace(" w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-green", "");
  }
}
</script>


</body>


</html>
}]

puts $CreatedFile $CreatedFile_Content

close $CreatedFile

}

foreach {TargetFile InputFile NameInList} $include_pages {
  set CreatedFile [ open ${TargetFile} r ]
  set All_Content [read $CreatedFile]
  close $CreatedFile

  set horz_bar_idx [string first "myHorzBar" $All_Content]
  set All_Content [regsub -all -start $horz_bar_idx -- {demoAcc} $All_Content {demoAcc2}] 

  set CreatedFile [ open ${TargetFile} w+ ]
  set modified_Content [format {string map {"ACTIVE_%s_LIST_COLOR" "w3-text-teal"} $All_Content} $NameInList]
  set modified_Content [eval $modified_Content]
  set modified_Content [string map {"SUB_LIST" ""} $modified_Content]

  puts $CreatedFile $modified_Content

  close $CreatedFile
}


puts "generation is done successfully"