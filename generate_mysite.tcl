#!/usr/bin/tclsh

set WelcomeString "Generate Webpages"
#----------------------------------------------------

puts "start $WelcomeString process ..."

set include_pages [list \
	000/home.html                           site_contents/00_home/content_home.html           home_list \
	002/tajweed.html                        site_contents/01_01_tajweed.html                  tajweed_list \
	003/paradigm.html                       site_contents/01_02_paradigm.html                 paradigm_list \
	004/qinfo.html                          site_contents/01_03_Qinfographic.html             qinfo_list \
	001/islamic_home.html                   site_contents/01_00_islamic_home.html             islamic_list \
	03_01/synbucket.html                    site_contents/03_01_synbucket.html                synbucket_list \
    03_00/language_home.html                site_contents/03_00_language_home.html            language_list\
    engineering/importantintegrations.html  site_contents/02_01_importantintegration.html    integration_list\
    engineering/eng_home.html               site_contents/02_00_engineering_home.html         engineering_list\
]




set home_list [list MAIN_LIST \
{
    <a href="LEVEL/PATH_TO_REF#root"    onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR"><i class="fa fa-home     fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">الرئيسية</div> </a> 
    <a href="LEVEL/PATH_TO_REF#about"   onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">                  <i class="fa fa-user     fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">مقدم المحتوى</div></a> 
    <a href="LEVEL/PATH_TO_REF#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-right w3-padding">                  <i class="fa fa-envelope fa-fw w3-padding-small w3-margin-left w3-right"></i><div class="w3-right">للاتصال بنا</div></a>
}]
# Note: icons of the list can be reviewed at
# https://www.w3schools.com/icons/fontawesome_icons_webapp.asp



set islamic_list [list MAIN_LIST \
 { 
<button  onclick="myAccFunc('demoAcc')" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR" >
  <i class="fa fa-book fa-fw w3-margin-left w3-padding-small w3-right"></i>
  <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-right w3-margin-left"> <div class="w3-right">ملفات إسلامية</div></a>
  <i class="fa fa-caret-down fa-fw w3-padding-small w3-right"></i>
</button>
<div id="demoAcc" class="w3-hide w3-container">
  SUB_LIST
</div> }]


set tajweed_list [list islamic_list \
 { <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">تجويد القرآن</div></a> } ]

set paradigm_list [list islamic_list \
 { <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">النموذج المعرفي</div></a> } ]

set qinfo_list [list islamic_list \
 { <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">Quran Infographic</div></a> } ]



set language_list [list MAIN_LIST \
 { 
<button  onclick="myAccFunc('languageAcc')" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR" >
  <i class="fa fa-book fa-fw w3-margin-left w3-padding-small w3-right"></i>
  <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-right w3-margin-left"> <div class="w3-right">ملفات لغوية</div></a>
  <i class="fa fa-caret-down fa-fw w3-padding-small w3-right"></i>
</button>
<div id="languageAcc" class="w3-hide w3-container">
  SUB_LIST
</div> }]


set synbucket_list [list language_list \
 { <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">Synbucket</div></a> } ]


set engineering_list [list MAIN_LIST \
 { 
<button  onclick="myAccFunc('engineeringAcc')" class="w3-bar-item w3-button w3-right w3-padding ACTIVE_LIST_COLOR" >
  <i class="fa fa-book fa-fw w3-margin-left w3-padding-small w3-right"></i>
  <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-right w3-margin-left"> <div class="w3-right">ملفات هندسية</div></a>
  <i class="fa fa-caret-down fa-fw w3-padding-small w3-right"></i>
</button>
<div id="engineeringAcc" class="w3-hide w3-container">
  SUB_LIST
</div> }]


set integration_list [list engineering_list \
 { <a href="LEVEL/PATH_TO_REF" onclick="w3_close()" class="w3-bar-item w3-button w3-right ACTIVE_LIST_COLOR">
     <i class="fa fa-file-o fa-fw w3-padding-small w3-margin-left w3-right"></i>
     <div class="w3-right">32 تكاملات مهمة</div></a> } ]


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
<head>
<title>Arabic Legacy</title>
<link rel="icon" href="LEVEL/site_contents/shots/arabiclegacy_logo.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="LEVEL/interface_css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Amiri}
</style>

<!-- Global site tag (gtag.js) - Google Analytics -->
<!--
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-174131781-1"></script>
<script>
  window.dataLayer = window.dataLayer || \[\];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-174131781-1');
</script>
-->

<!-- Matomo -->
<!--
<script type="text/javascript">
  var _paq = window._paq = window._paq || \[\];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(\['trackPageView'\]);
  _paq.push(\['enableLinkTracking'\]);
  (function() {
    var u="https://arabiclegacy.matomo.cloud/";
    _paq.push(\['setTrackerUrl', u+'matomo.php'\]);
    _paq.push(\['setSiteId', '1'\]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')\[0\];
    g.type='text/javascript'; g.async=true; g.src='//cdn.matomo.cloud/arabiclegacy.matomo.cloud/matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->
-->


<!-- Clicky -->
<script>var clicky_site_ids = clicky_site_ids || \[\]; clicky_site_ids.push(101301402);</script>
<script async src="//static.getclicky.com/js"></script>
<!-- End Clicky Code -->


</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-right" style="z-index:3;width:18%;right:0" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
    <i class="fa fa-remove"></i>
    </a>
    <img src="LEVEL/site_contents/shots/arabiclegacy_logo.png" style="width:45%;" class="w3-round"><br>
    <h3><b>إرث عربي</b></h3>
    <p class="w3-text-grey">ملفات شخصية</p>
  </div>
  <div class="w3-bar-block">
    <div class="w3-right">
    $sidebar_content
    </div>
  </div>
  <div class="w3-panel w3-large">
    <a href= "https://www.facebook.com/erth.arabi"> <i class="fa fa-facebook-official w3-hover-opacity"></i> </a>
    <a href= "https://www.github.com/arabiclegacy"> <i class="fa fa-github w3-hover-opacity"></i> </a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>



<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-right:20%">
<img src="LEVEL/site_contents/shots/arabiclegacy_fb_cover.png" style="width:100%;" class="w3-round">

<nav class="w3-bar w3-sand w3-border w3-padding-small" id="myHorzBar">
    <img src="LEVEL/site_contents/shots/arabiclegacy_logo.png" style="width:5%;" class="w3-round w3-right w3-padding-small">
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
  set All_Content [regsub -all -start $horz_bar_idx -- {languageAcc} $All_Content {languageAcc2}] 
  set All_Content [regsub -all -start $horz_bar_idx -- {engineeringAcc} $All_Content {engineeringAcc2}] 

  set num_occur [expr {[llength [split $TargetFile {/}]] - 1}]
  set up_lvl [string repeat {../} $num_occur]

  set CreatedFile [ open ${TargetFile} w+ ]
  set modified_Content [format {string map {"ACTIVE_%s_LIST_COLOR" "w3-text-teal" "LEVEL/" "%s"} $All_Content} $NameInList $up_lvl]
  set modified_Content [eval $modified_Content]
  set modified_Content [string map {"SUB_LIST" ""} $modified_Content]

  puts $CreatedFile $modified_Content

  close $CreatedFile
}


puts "generation is done successfully"