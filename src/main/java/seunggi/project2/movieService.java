package project2;

import java.util.List;

public class movieService {

	movieDAO movieDAO;
	
	public movieService() {
		movieDAO = new movieDAO();
	}
	
	public List<movieVO> choicemovies(String choicename){
		List<movieVO> list = movieDAO.selectChoiceNames(choicename);
		return list;
	}

	public movieVO writeDate(){
		movieVO vo = movieDAO.selectWriteDate();
		return vo;

	}
	
	public void addMovie(movieVO vo)	{
		movieDAO.insertMovie(vo);
		
	}
	

	
}
