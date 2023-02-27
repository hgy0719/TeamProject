package seunggi;

import java.sql.Date;

public class EventVO {
	
	public EventVO() {
		System.out.println("EventVO 생성자 실행");
	}
	
	public EventVO(String id, String title, String firstimage, String firstimagead , String secondimage, String eventday ) {
		this.id=id;
		this.title=title;
		this.firstimage=firstimage;
		this.firstimagead=firstimagead;
		this.secondimage=secondimage;
		this.eventday=eventday;
	}
	
	public EventVO(int level, int articleNO, int parentNO, String replytitle , String content, String replyid, Date writeDate ) {
		this.level = level;
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.replytitle = replytitle;
		this.content = content;
		this.replyid = replyid;
		this.writeDate = writeDate;
	}
	
	public EventVO(String id, String title, String firstimage, String secondimage, String eventday ) {
		this.id=id;
		this.title=title;
		this.firstimage=firstimage;
		this.secondimage=secondimage;
		this.eventday=eventday;
	}
	
	
	private int level;
	private	 int articleNO;
	private int parentNO;
	private String replytitle;
	private String content;
	private String replyid;
	private Date writeDate;
	
	
	private String id;
	private String title;
	private String firstimage;
	private String firstimagead;
	private String secondimage;
	private String eventday;
	
	
	public int getLevel() {
		return level;
	}

	public int getArticleNO() {
		return articleNO;
	}

	public int getParentNO() {
		return parentNO;
	}

	public String getReplytitle() {
		return replytitle;
	}

	public String getContent() {
		return content;
	}

	public String getReplyid() {
		return replyid;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}

	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}

	public void setReplytitle(String replytitle) {
		this.replytitle = replytitle;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getFirstimagead() {
		return firstimagead;
	}

	public void setFirstimagead(String firstimagead) {
		this.firstimagead = firstimagead;
	}

	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}

	public String getEventday() {
		return eventday;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public void setEventday(String eventday) {
		this.eventday = eventday;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public String getSecondimage() {
		return secondimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public void setSecondimage(String secondimage) {
		this.secondimage = secondimage;
	}
	
	
}
