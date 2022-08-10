package net.admin.db;

public class NoticeBean {
	private int		notice_num;	     //글번호
	private String	notice_name;     //글 작성자
	private String	notice_pass;     //글 비밀번호
	private String	notice_subject;  //글 제목
	private String	notice_content;  //글 내용
	private String	notice_file;     //첨부될 파일의 이름
	private int		notice_re_ref;   //답변 글 작성시 참조되는 글의 번호
	private int		notice_re_lev;   //답변 글 길이
	private int		notice_re_seq; 	 //답변 글 순서
	private int		notice_readcount;//글의 조회수
	private String  notice_date;
	private int cnt;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_pass() {
		return notice_pass;
	}
	public void setNotice_pass(String notice_pass) {
		this.notice_pass = notice_pass;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public int getNotice_re_ref() {
		return notice_re_ref;
	}
	public void setNotice_re_ref(int notice_re_ref) {
		this.notice_re_ref = notice_re_ref;
	}
	public int getNotice_re_lev() {
		return notice_re_lev;
	}
	public void setNotice_re_lev(int notice_re_lev) {
		this.notice_re_lev = notice_re_lev;
	}
	public int getNotice_re_seq() {
		return notice_re_seq;
	}
	public void setNotice_re_seq(int notice_re_seq) {
		this.notice_re_seq = notice_re_seq;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
}
