<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.awt.Graphics2D"%>
<%@ page import="java.awt.image.renderable.ParameterBlock"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.media.jai.JAI"%>
<%@ page import="javax.media.jai.RenderedOp"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<% 
	String imagePath=getServletContext().getRealPath("/fileSave"); 
	int size = 2*1024*1024 ; 
	String filename=""; 
	try{ 
		MultipartRequest multi=new MultipartRequest(request,
			imagePath,size,"utf-8", 
			new DefaultFileRenamePolicy()); 
		Enumeration files=multi.getFileNames(); 
		String file =(String)files.nextElement(); 
		filename=multi.getFilesystemName(file); 
	}catch(Exception e){ e.printStackTrace(); } 
	// �� Ŭ������ ��ȯ�� �̹����� ��´�.(�̹����� ParameterBlock�� ���ؼ��� ������ �ִ�.)
	ParameterBlock pb=new ParameterBlock();
	// ������ ����� ���������� ��η� �Ķ���ͺ�Ͽ� �߰�
	//������ ������ �����̸��� �޾Ƽ� �̹����佺�� ������ �����ӿ� ������ �������
	pb.add(imagePath+"/"+filename);
	//���̷� �Ķ���ͺ���� �ε��Ͽ� RenderedOp �� ����
	RenderedOp rOp=JAI.create("fileload",pb); 
	//�ҷ��� �̹����� BuffedImage�� ��´�.
	BufferedImage bi= rOp.getAsBufferedImage();
	//thumb��� �̹��� ���۸� ����, ������ ������� 100*100���� ����.
	BufferedImage thumb=new BufferedImage(100,100,
			BufferedImage.TYPE_INT_RGB); 
	Graphics2D g=thumb.createGraphics(); 
	//���ۻ����� 100*100���� ���� �׸���
	g.drawImage(bi,0,0,100,100,null); 
	/*����� ��ġ�� �����̸��� �����ϰ� ������ �̹����� �����Ѵ�. �����ϴ� Ÿ���� jpg�� ����.*/
	 //�� ������ ������ ���ϸ� �����Ų��
	File file=new File(imagePath+"/sm_"+filename); 
	//���۰����� ������ ������ �̹��� ���ϸ��� �ҷ��� jpg�Ӽ����� ��½�Ų��
	ImageIO.write(thumb,"jpg",file); 
%>
<html>
<head>
<title>�̹��� ����� ����</title>
</head>
<body>
	-���� �̹���-
	<br>
	<img src="../fileSave/<%=filename %>">
	<p>
		-����� �̹���-<br> <img src="../fileSave/sm_<%=filename %>">
</body>
</html>