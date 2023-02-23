package changsoon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MovieService {

	MovieDAO movieDAO;
	
	public MovieService() {
		movieDAO = new MovieDAO();
	}
	
	public List<MovieVO> list1() {
		List<MovieVO> movieList = movieDAO.listMovies();
		return movieList;
	}
	
	public List<MovieVO> listTheater() {
		List<MovieVO> listTheater = movieDAO.listTheater();
		return listTheater;
	}
	
	public List<MovieVO> list0(int articleNO) {
		List<MovieVO> movieList0 = movieDAO.listMovies2(articleNO);
		return movieList0;
	}
	
	public List<MovieVO> list2() {
		List<MovieVO> movieList2 = movieDAO.movie_count();
		return movieList2;
	}
	
	
//	페이징 기능
	public Map list4(Map pagingMap, int articleNO) {
		Map articlesMap = new HashMap();
		List<MovieVO> articlesList = movieDAO.listMovies(pagingMap, articleNO);
		int totArticles = movieDAO.selectTotArticles();
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		return articlesMap;
	}
	
	
	
	
	public List<MovieVO> search(String search_text){
		List<MovieVO> movieList3 = movieDAO.searchMovies(search_text);
		return movieList3; 
	}
	
	public void add(MovieVO movieVO) {
		movieDAO.addMoive(movieVO);
	}
	
	public void up(MovieVO movieVO) {
		movieDAO.updateMovie(movieVO);
	}
	
	public void del(String title) {
		movieDAO.delMovie(title);
	}
	
	public void uplike(int articleNO) {
		movieDAO.update_Like(articleNO);
	}
	public int selike(int articleNO) {
		int like = movieDAO.select_Like(articleNO);
		return like;
	}
	
	public MovieVO viewArticle(int articleNO) {
		MovieVO article = null;
		article = movieDAO.selectArticle(articleNO);
		return article;
	}
	
	
	public void upComment(int articleNO, String comment_id, String comment_text, String comment_rate) {
		movieDAO.upComment(articleNO, comment_id, comment_text, comment_rate);
	}
	
	public void upComment2(int articleNO, int upComment2, String comment_id, String comment_text) {
		movieDAO.upComment2(articleNO, upComment2, comment_id, comment_text);
	}
	
	
	public List<MovieVO> comment_list() {
		List<MovieVO> comment_list = movieDAO.comment_list();
		return comment_list;
	}
}
