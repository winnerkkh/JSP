package util;

import javax.servlet.http.HttpServletRequest;

public class Paging {
		
	 public PageBean getPaging(HttpServletRequest request, int total) {
	         PageBean pb = new PageBean();
	         String pageNum = request.getParameter("pageNum");
	         if(pageNum==null||pageNum.equals("")) {
	        	 pageNum="1";
	         }
	          pb.setBLOCKSIZE(10);
	          pb.setPAGESIZE(10);
	         int currPage = Integer.parseInt(pageNum);
	         int startRow = (currPage -1)*pb.getPAGESIZE()+1;
	         int endRow = startRow + pb.getPAGESIZE() -1;
	         
	         int pageCount = (int)Math.ceil((double)total/pb.getPAGESIZE());
	         int startPage = (currPage -1)/pb.getBLOCKSIZE()*pb.getBLOCKSIZE() +1;
	         int endPage = startPage +pb.getBLOCKSIZE() -1;
	         if(endPage > pageCount) endPage = pageCount;
	         int rowNum = total - startRow +1;
	         
	         pb.setPageNum(pageNum);
	         pb.setCurrentPage(currPage);
	         pb.setStartRow(startRow);
	         pb.setEndRow(endRow);
	         pb.setPageCount(pageCount);
	         pb.setStartPage(startPage);
	         pb.setEndPage(endPage);
	         pb.setRowNum(rowNum);
	         
		 return pb;
		}

}
