package team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
	
	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}
	
	public List<ArticleVO> listArticles(){
		List<ArticleVO> list = boardDAO.selectAllArticles();
		return list;
	}
	
	public List<ArticleVO> listArticles1(){
		List<ArticleVO> list = boardDAO.selectAllArticles1();
		return list;
	}
	
	
	public void addArticle(ArticleVO vo) {
		boardDAO.insertNewArticle(vo);
		
	}
	
	public ArticleVO viewArticle(int articleNO) {
		return boardDAO.selectArticle(articleNO);
	}
	
	// 수정 기능
	
	public void update(ArticleVO article) {
		boardDAO.update(article);
	}
	
	// 페이징관련
	
//	public Map getPagingList(int pageNum, int countPerPage) {
//		BoardDAO dao = new BoardDAO();
//		
//		int start = 0, end = 0;
//		
//		start = (countPerPage*(pageNum-1))+1;
//		
//		end = start + countPerPage -1;
//		List list = dao.selectPagingList(start,end);
//		
//		int totalCount = dao.selectTotalList();
//		
//		Map map = new HashMap();
//		map.put("list", list);
//		map.put("totalCount", totalCount);
//		
//		return map;
//		
//	}

	
}
