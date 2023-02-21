package changsoon;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {
	
	private String title;
	private String title_en;
	private String age;
	private String opendate;
	private int like_num;
	private int rate;
	private String explain;
	private String director;
	private String genre;
	private String runningtime;
	private String actor;
	private String poster_back;
	private String poster_main;
	
	private String nickname;
	private String profile_image;
	
	private int count;
	
	private int articleNO;
	
	private String comment_text;
	private String comment_id;
	private int parentNO;
	private int commentNO;
	private int comment_rate;
	
	private int level;
}
