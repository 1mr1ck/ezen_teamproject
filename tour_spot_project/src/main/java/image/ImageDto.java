package image;

public class ImageDto {
	
	int board_no;		// FK
	String thumbnail, url, movie;
	
	public ImageDto(int board_no, String thumbnail, String url, String movie) {
		super();
		this.board_no = board_no;
		this.thumbnail = thumbnail;
		this.url = url;
		this.movie = movie;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	
//	public void setBoard_no(int board_no) {
//		this.board_no = board_no;
//	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getMovie() {
		return movie;
	}
	
	public void setMovie(String movie) {
		this.movie = movie;
	}
}
