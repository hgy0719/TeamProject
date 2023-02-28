package team;

import java.sql.Date;

public class ArticleVO {

	private int level;
	private int articleNO;
	private int parentNO = 0;
	private int n;
	private String title;
	private String content;
	private String imageFileName;
	private String id;
	private Date writeDate;
	
	/**
	 * @return the level
	 */
	public int getLevel() {
		return level;
	}
	/**
	 * @param level the level to set
	 */
	public void setLevel(int level) {
		this.level = level;
	}
	/**
	 * @return the articleNO
	 */
	public int getArticleNO() {
		return articleNO;
	}
	/**
	 * @param articleNO the articleNO to set
	 */
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	/**
	 * @return the parentNO
	 */
	public int getParentNO() {
		return parentNO;
	}
	/**
	 * @param parentNO the parentNO to set
	 */
	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the imageFileName
	 */
	public String getImageFileName() {
		return imageFileName;
	}
	/**
	 * @param imageFileName the imageFileName to set
	 */
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the writeDate
	 */
	public Date getWriteDate() {
		return writeDate;
	}
	/**
	 * @param writeDate the writeDate to set
	 */
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public void setWriteDate(String writeDate1) {
		// TODO Auto-generated method stub
		
	}
	public void getWriteDate(String writeDate1) {
		// TODO Auto-generated method stub
		
	}
	
	
		
}
