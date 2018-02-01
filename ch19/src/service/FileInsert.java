package service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PdsItemDao;
import dto.PdsItem;

public class FileInsert {
	
	public int  addFile2(HttpServletRequest request) throws IOException, ServletException {
		int result =0;
		
		String realFile = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 5*1024*1024;//한번에 전송되는  최대 크기
		Collection<Part> parts = request.getParts();
		String fileName="";
		String description="";
		long fileSize=0;
		for(Part part:parts) {
			String contentType = request.getContentType();
if(contentType!=null &&contentType.toLowerCase().startsWith("multipart/")) {
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				fileName = part.getSubmittedFileName();//업로드된 파일 명 
				fileSize=(long)part.getSize();//업로드된 파일 사이즈
				if(fileSize>0) {
					part.write(realFile+"/"+fileName);//업로드한 파일을 기록하기
				    part.delete();//크기가 큰파일이 threshhold단위로 남아있는 temp파일들 삭제
				}
			}else {
					description=request.getParameter(part.getName());
			}
		}}
		//bean에 저장
		PdsItem pi = new PdsItem();
		pi.setFilename(fileName);
		pi.setDescription(description);
		pi.setFilesize(fileSize);
		
		//DB에 저장처리
		PdsItemDao dao = PdsItemDao.getInstance();
		result = dao.insert(pi);//파일 DB입력처리 메소드 호출
		return result;
	}
	
	
	public int  addFile(HttpServletRequest request) {
		int result =0;
		MultipartRequest mr = null;
		
		String realFile = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 5*1024*1024;//한번에 전송되는  최대 크기
		try {
			   mr = new MultipartRequest(request, 
					                                   realFile, 
					                                   maxSize, 
					                                   "utf-8",
					                                   new DefaultFileRenamePolicy());
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		String fileName = mr.getFilesystemName("file");
		String description = mr.getParameter("description");
		File file = new File(realFile+"/"+fileName);
		long fileSize = (long)file.length();
		//bean에 저장
		PdsItem pi = new PdsItem();
		pi.setFilename(fileName);
		pi.setDescription(description);
		pi.setFilesize(fileSize);
		
		//DB에 저장처리
		PdsItemDao dao = PdsItemDao.getInstance();
		result = dao.insert(pi);//파일 DB입력처리 메소드 호출
		return result;
	}
}
