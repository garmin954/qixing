$(document).ready(function() {
	
	var AO3=$("#advsexDiv3");
	var AL3=$("#advsex3");
	var AO3F=AO3.offset();

	//¼æÈÝÎ´Éý¼¶°æ±¾ÅÐ¶Ï£¬·ÀÖ¹Î´Éý¼¶Ê±²åÈë±¾²å¼þ³ö´í
	if(AL3.length>0 && AO3.length){      
		AL3[0].style.background=AO3[0].style.background;
		AL3.css({height: AO3[0].offsetHeight+"px",top:AO3F.top+"px"});
		AL3.show();
	}

});
