$(document).ready(function() {
	
	var AO3=$("#advsexDiv3");
	var AL3=$("#advsex3");
	var AO3F=AO3.offset();

	//����δ�����汾�жϣ���ֹδ����ʱ���뱾�������
	if(AL3.length>0 && AO3.length){      
		AL3[0].style.background=AO3[0].style.background;
		AL3.css({height: AO3[0].offsetHeight+"px",top:AO3F.top+"px"});
		AL3.show();
	}

});
