$(document).ready(function() {
	
	var AO1=$("#advsexDiv1");
	var AL1=$("#advsex1");
	var AO1F=AO1.offset();

	//¼æÈÝÎ´Éý¼¶°æ±¾ÅÐ¶Ï£¬·ÀÖ¹Î´Éý¼¶Ê±²åÈë±¾²å¼þ³ö´í
	if(AL1.length>0 && AO1.length){      
		AL1[0].style.background=AO1[0].style.background;
		AL1.css({height: AO1[0].offsetHeight+"px",top:AO1F.top+"px"});
		AL1.show();
	}

});
