package image;

public class ImageDto {
	
	private int b_no;			// FK
	private String thumbnail; 
	private String img_url;
	private String movie_url;
	
	public ImageDto(int b_no, String thumbnail, String img_url, String movie_url) {
		super();
		this.b_no = b_no;
		this.thumbnail = thumbnail;
		this.img_url = img_url;
		this.movie_url = movie_url;
	}

	public ImageDto(int b_no, String thumbnail) {
		super();
		this.b_no = b_no;
		this.thumbnail = thumbnail;
	}

	public int getB_no() {
		return b_no;
	}

//	public void setB_no(int b_no) {
//		this.b_no = b_no;
//	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getMovie_url() {
		return movie_url;
	}

	public void setMovie_url(String movie_url) {
		this.movie_url = movie_url;
	}
}
