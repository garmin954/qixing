$(document).ready(function() {
	
	var AO4=$("#advsexDiv4");
	var AL4=$("#advsex4");
	var AO4F=AO4.offset();

	//����δ�����汾�жϣ���ֹδ����ʱ���뱾�������
	if(AL4.length>0 && AO4.length){      
		AL4[0].style.background=AO4[0].style.background;
		AL4.css({height: AO4[0].offsetHeight+"px",top:AO4F.top+"px"});
		AL4.show();
	}

});
