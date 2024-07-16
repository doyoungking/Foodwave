package www.silver.vo;

public class tf_commentVO {


	private int c_no = 0;
	private String c_user = null;
	private String tf_comment = null;
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_user() {
		return c_user;
	}
	public void setC_user(String c_user) {
		this.c_user = c_user;
	}
	public String getTf_comment() {
		return tf_comment;
	}
	public void setTf_comment(String tf_comment) {
		this.tf_comment = tf_comment;
	}
	@Override
	public String toString() {
		return "tf_commentVO [c_no=" + c_no + ", c_user=" + c_user + ", tf_comment=" + tf_comment + "]";
	}
	
}
