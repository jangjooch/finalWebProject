package web.dto.notice;

import java.util.Date;

import web.dto.member.MemberDto;

public class NoticeDto {
	
	// 게시물 번호
	private int noticeNo;
	// 제목
	private String noticeTitle;
	// 작성자
	private String writer;
	// 내용
	private String contents;
	// 작성일
	private Date writeDate;
	// 조회수
	private int hitcount;
	// 자료
	private String datum;
	
	// 댓글 번호
	private int commentNo;
	// 댓글 내용
	private String commentCon;
	// 댓글 작성자
	private String commenter;
	// 댓글 작성일
	private Date commentDate;
	
	private MemberDto memberDto;

	
	
	
	
	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getDatum() {
		return datum;
	}

	public void setDatum(String datum) {
		this.datum = datum;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentCon() {
		return commentCon;
	}

	public void setCommentCon(String commentCon) {
		this.commentCon = commentCon;
	}

	public String getCommenter() {
		return commenter;
	}

	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public MemberDto getMemberDto() {
		return memberDto;
	}

	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
	
	
	
	
	
	
	
}
